# Python installation/setup script - Install and setup the system with the required languages/SDK/Framework/appropriate tooling and host system pre-requisites install

## Initialize Variables
PY_VERSION=${PY_VERSION:-3.13}
PY_PLATFORM=${PY_PLATFORM:-linux}
PY_ARCHITECTURE=${PY_ARCHITECTURE:-amd64}
CONFIG_OPTS=${CONFIG_OPTS:-""}

## Update package manager repository database and Upgrade all installed packages
sudo apt update && sudo apt upgrade

## Start setup

### Build python3 from source
git clone https://github.com/python/cpython
cd cpython
./configure ${CONFIG_OPTS} --with-ensurepip=install --prefix=/usr/local/
make
make install
python3 --version || \
    echo -e "[-] Error building python${PY_VERSION}"; \
    exit 1

### Bootstrap Install pip into the install directory
python3 --version && \
    python3 -m ensurepip --default

### Install Python toolkit and dependencies
sudo apt install nodejs npm
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

## Success
echo -e "[+] Python${PY_VERSION} has been successfully installed"

