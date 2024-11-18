# Self-Hosted Cloud IDE server setup script - Install and setup the system with the required languages/SDK/Framework/appropriate tooling and host system pre-requisites install

## Initialize Variables
GO_VERSION=${GO_VERSION:-1.23.2}
GO_PLATFORM=${GO_PLATFORM:-linux}
GO_ARCHITECTURE=${GO_ARCHITECTURE:-amd64}

## Update package manager repository database and Upgrade all installed packages
sudo apt update && sudo apt upgrade

## Start setup

### Install Golang SDK and Toolkit
curl -L https://go.dev/dl/go${GO_VERSION}.${GO_PLATFORM}-${GO_ARCHITECTURE}.tar.gz -o $HOME/go${GO_VERSION}.${GO_PLATFORM}-${GO_ARCHITECTURE}.tar.gz
if [[ -d /usr/local/go ]]; then
    ### Check if '$PREFIX/go' exists
    ### If exists - delete
    sudo rm -rf /usr/local/go
fi
sudo tar -C /usr/local -xvzf $HOME/go${GO_VERSION}.${GO_PLATFORM}-${GO_ARCHITECTURE}.tar.gz
echo -e "PATH=\$PATH:/usr/local/go/bin" >> $HOME/.bashrc
source $HOME/.bashrc
go install -v golang.org/x/tools/gopls@latest
go install -v golang.org/x/tools/cmd/goimports@latest

### Install Python and dependencies
sudo apt install python3 python3-pip nodejs npm
sudo npm install -g pyright

## Set alias to the Shell RC file
declare -A alias_map=(
    ["reload"]="source \$HOME/.bashrc"
    ["python"]="python3"
)
for k in "${alias_map[@]}"; do
    # Get current value
    v="${alias_map[$k]}"

    echo -e "alias $k=\"$v\"" >> $HOME/.bashrc
done
