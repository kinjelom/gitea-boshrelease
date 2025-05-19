## gitea-1.23.8-linux-amd64 --help

NAME:
   gitea - A painless self-hosted Git service

USAGE:
   gitea [global options] command [command options]

VERSION:
   1.23.8 built with GNU Make 4.3, go1.23.9 : bindata, sqlite, sqlite_unlock_notify

DESCRIPTION:
   Gitea program contains "web" and other subcommands. If no subcommand is given, it starts the web server by default. Use "web" subcommand for more web server arguments, use other subcommands for other purposes.

COMMANDS:
   help, h          Shows a list of commands or help for one command
   web              Start Gitea web server
   serv             (internal) Should only be called by SSH shell
   hook             (internal) Should only be called by Git
   keys             (internal) Should only be called by SSH server
   dump             Dump Gitea files and database
   admin            Perform common administrative operations
   migrate          Migrate the database
   doctor           Diagnose and optionally fix problems, convert or re-create database tables
   manager          Manage the running gitea process
   embedded         Extract embedded resources
   migrate-storage  Migrate the storage
   dump-repo        Dump the repository from git/github/gitea/gitlab
   restore-repo     Restore the repository from disk
   actions          Manage Gitea Actions
   cert             Generate self-signed certificate
   generate         Generate Gitea's secrets/keys/tokens
   docs             Output CLI documentation

GLOBAL OPTIONS:
   --version, -v                  print the version
   --help, -h                     show help
   --custom-path value, -C value  Set custom path (defaults to '{WorkPath}/custom')
   --config value, -c value       Set custom config file (defaults to '{WorkPath}/custom/conf/app.ini')
   --work-path value, -w value    Set Gitea's working path (defaults to the Gitea's binary directory)

## gitea-1.23.8-linux-amd64 web --help

NAME:
   gitea web - Start Gitea web server

USAGE:
   gitea web command [command options]

DESCRIPTION:
   Gitea web server is the only thing you need to run,
   and it takes care of all the other things for you

COMMANDS:
   help, h  Shows a list of commands or help for one command

OPTIONS:
   --help, -h                     show help
   --custom-path value, -C value  Set custom path (defaults to '{WorkPath}/custom')
   --config value, -c value       Set custom config file (defaults to '{WorkPath}/custom/conf/app.ini')
   --work-path value, -w value    Set Gitea's working path (defaults to the Gitea's binary directory)
   --port value, -p value         Temporary port number to prevent conflict (default: "3000")
   --install-port value           Temporary port number to run the install page on to prevent conflict (default: "3000")
   --pid value, -P value          Custom pid file path (default: "/run/gitea.pid")
   --quiet, -q                    Only display Fatal logging errors until logging is set-up (default: false)
   --verbose                      Set initial logging to TRACE level until logging is properly set-up (default: false)
