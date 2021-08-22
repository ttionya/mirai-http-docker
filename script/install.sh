#!/usr/bin/env bash

MCL_INSTALLER_VERSION="1.0.3"
MCL_INSTALLER_FILE="mcl-installer-${MCL_INSTALLER_VERSION}-linux-amd64"


function set_language() {
    echo 'LANG="C.UTF-8"' > /etc/locale.conf
    source /etc/locale.conf
}

function install_dependency() {
    yum -y install wget
    if [[ $? != 0 ]]; then
        echo "install dependency failed"
        exit 1
    fi

    # clean
    yum clean all
    rm -rf /var/cache/dnf
}

function download_mcl() {
    # download installer
    wget -c -t3 -T60 "https://github.com/iTXTech/mcl-installer/releases/download/v${MCL_INSTALLER_VERSION}/${MCL_INSTALLER_FILE}"
    if [[ $? != 0 ]]; then
        rm -rf ${MCL_INSTALLER_FILE}
        echo "download mcl-installer failed"
        exit 1
    fi

    chmod +x "${MCL_INSTALLER_FILE}"

    # download mcl
    "./${MCL_INSTALLER_FILE}" << EOF
Y
16
JRE
x64
Y
EOF
    if [[ $? != 0 ]]; then
        echo "mcl-installer run failed"
        exit 1
    fi

    # clean
    rm -rf "${MCL_INSTALLER_FILE}"
}

function download_core() {
    ./mcl --dry-run
    if [[ $? != 0 ]]; then
        echo "mcl run failed"
        exit 1
    fi
}


set_language
install_dependency

cd "/mirai"

download_mcl
download_core
