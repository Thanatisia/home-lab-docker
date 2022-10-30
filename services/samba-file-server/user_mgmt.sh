: "
User Management for Alpine Linux 
"

declare -A users=(
    # [Username]="Password"
    [admin]=Password
)

for username in "${!users[@]}"; do
    password="${users[$username]}"
    # Create User
    adduser -H -D "$username"

    # Assign Password
    # Command is repeated twice and grouped together because 
    # passwd and smbpasswd requires repeated input for password validation
    echo -e "Password for [$username] : $password"
    (echo -e "$password"; echo -e "$password") | passwd $username
    echo -e "SMB Password for [$username] : $password"
    (echo -e "$password"; echo -e "$password") | smbpasswd -a "$username"
done
