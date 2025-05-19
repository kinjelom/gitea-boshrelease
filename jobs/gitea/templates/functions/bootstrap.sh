#!/usr/bin/env bash
set -euo pipefail

# ensure_gitea_user: ensure a Gitea user exists (create if missing)
# Usage: ensure_gitea_user <username> <email> <password> <admin>
ensure_gitea_user() {
    local username="$1"
    local email="$2"
    local password="$3"
    local admin="$4"
    local gitea_bin="/var/vcap/packages/gitea/bin/gitea"
    local config_file="/var/vcap/store/gitea/config/app.ini"

    # Check if the user already exists
    if sudo -u vcap "$gitea_bin" admin user list --config "$config_file" | awk '{print $2}' | grep -qx "$username"; then
        return 0
    fi

    # Create the user
    sudo -u vcap "$gitea_bin" admin user create --config "$config_file" --username "$username" --email "$email" \
        --password "$password" --must-change-password=false --admin "$admin"

}
