#!/bin/env bash
# Python installation/setup script - Install and setup the system with the required languages/SDK/Framework/appropriate tooling and host system pre-requisites install

## Initialize Variables
GIT_REPO_TAG_VERSION=${GIT_REPO_TAG_VERSION:-"main"}
PY_VERSION=${PY_VERSION:-""}
PY_PLATFORM=${PY_PLATFORM:-linux}
PY_ARCHITECTURE=${PY_ARCHITECTURE:-amd64}
CC="${CC:-make}"
CFLAGS="${CFLAGS:-""}"
CINSTALLFLAGS="${CINSTALLFLAGS:-""}"
CONFIG_OPTS=${CONFIG_OPTS:-""}
PREFIX=${PREFIX:-$HOME/.local/python${PY_VERSION}}
DISTRO="${DISTRO:-debian}"

case "$DISTRO" in
    "deb" | "debian")
        ## Update package manager repository database and Upgrade all installed packages
        sudo apt update && sudo apt upgrade

        ## Install build dependencies
        sudo apt install git make gcc build-essential pkg-config \
            libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
            libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
            lzma lzma-dev tk-dev uuid-dev zlib1g-dev
        ;;
    "arch" | "archlinux")
        ## Update package manager repository database and Upgrade all installed packages
        sudo pacman -Syu

        ## Install build dependencies
        sudo pacman -S git make gcc base-devel pkg-config gdb lcov pkg-config \
            libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
            libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
            lzma lzma-dev tk-dev uuid-dev zlib1g-dev libmpdec-dev
        ;;
    *)
        echo -e "[X] Invalid distribution: ${DISTRO}"
        exit 1
        ;;
esac

## Start setup

### Build python3 from source
cd /tmp
git clone --branch=${GIT_REPO_TAG_VERSION} https://github.com/python/cpython
cd cpython
./configure ${CONFIG_OPTS} --with-ensurepip=install --prefix=${PREFIX} \
    && echo -e "[+] Configuration completed."; echo -e "" \
    || echo -e "[-] Error detected while configuring python${PY_VERSION}";
sudo ${CC} ${CFLAGS} || echo -e "[-] Error detected while building python${PY_VERSION}"
sudo ${CC} ${CINSTALLFLAGS} install || echo -e "[-] Error detected while installing python${PY_VERSION}"

# Check if the prefix is in the shell rc file
line=`cat $HOME/.bashrc | grep "$PREFIX/bin" | wc -l`
if [[ $line == 0 ]]; then
    ### Append the python installation directory (PREFIX) to the SHELL RC file
    echo -e "PATH=$PREFIX/bin:\$PATH" >> $HOME/.bashrc
    if [[ -f $HOME/.bashrc ]]; then
        echo -e "Sourcing $HOME/.bashrc"
        . ~/.bashrc
    fi
fi

### Bootstrap Install pip into the install directory
python3 --version 2> /dev/null && python3 -m ensurepip --default || \
    echo -e "[-] python${PY_VERSION} not found, perhaps you might want to check your \$PATH variable"; # \
    # exit 1

### Install Python toolkit and dependencies
sudo apt install nodejs npm
sudo npm install -g pyright

## Set alias to the Shell RC file
declare -A alias_map=(
    ["reload"]="source \$HOME/.bashrc"
    ["python"]="python3"
)
for k in "${!alias_map[@]}"; do
    # Get current value
    v="${alias_map[$k]}"

    # Check if alias is in the shell rc file
    line=`cat $HOME/.bashrc | grep "alias $k=\"$v\""`
    if [[ $line == "" ]]; then
        echo -e "alias $k=\"$v\"" >> $HOME/.bashrc
    else
        echo -e "[-] 'alias $k=\"$v\"'" found in the Shell RC file
    fi
done

. ~/.bashrc && \
    ## Success
    echo -e "[+] Python${PY_VERSION} has been successfully installed"
