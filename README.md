# Gitea BOSH Release

This [BOSH](https://bosh.io) release deploys [Gitea](https://gitea.io/), a lightweight self-hosted Git service, as a BOSH-managed job. 

## Features

* Installs and runs Gitea with minimal configuration
* Stores data persistently on the instance via `/var/vcap/store`
* Allows creation of initial users declaratively
* Fully configurable via `app.ini`-style properties
* Supports custom overrides of the base configuration
* Ships with metrics and LFS support enabled
* Optional SMTP and PostgreSQL/MariaDB configuration

## Usage

### `gitea.app_ini.base`

Default base configuration for the Gitea `app.ini` file, organized by sections.
This property is intended as **read-only** and provides a predefined baseline.
Do not modify this property directly. Instead, provide overrides using `gitea.app_ini.custom`.

### `gitea.app_ini.custom`

Custom overrides for the `app.ini` configuration.
Use this property to override specific values from `gitea.app_ini.base`.
This is the recommended way to configure Gitea.
Refer to https://docs.gitea.com/administration/config-cheat-sheet for available options.


### Manifest Example

```yaml
---
name: ((deployment_name))

instance_groups:
- name: gitea
  instances: 1
  vm_type: ((vm_type))
  persistent_disk_type: ((persistent_disk_type))
  stemcell: default
  azs: ((azs))
  networks:
  - name: default
  jobs:
  - name: gitea
    release: gitea
    tags:
      prometheus_exporter_port: ((gitea_web_port))
    properties:
      gitea:
        bootstrap:
          users:
            admin:
              email: "((gitea_admin_email))"
              password: "((gitea_admin_password))"
              admin: true
        app_ini:
          custom:
            general:
              APP_NAME: ((deployment_name))
            server:
              HTTP_PORT: ((gitea_web_port))
              DOMAIN: ((gitea_web_domain))
            security:
              INTERNAL_TOKEN: "((gitea_internal_token))"

variables:
- name: gitea_admin_password
  type: password
  options:
    length: 16
- name: gitea_internal_token
  type: password
  options:
    length: 64

releases:
- name: gitea
  version: ((gitea_version))

stemcells:
- alias: default
  os: ubuntu-jammy
  version: latest

update:
  canaries: 1
  max_in_flight: 1
  serial: false
  canary_watch_time: 1000-60000
  update_watch_time: 1000-60000
```
