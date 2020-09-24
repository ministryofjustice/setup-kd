#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

#######################################
# Functions
#######################################
declare -xr GITHUB_BIN="github-bin"

#######################################
# Functions
#######################################
function parse_verion() {
  if [[ "${INPUT_KD_VERSION}" == "latest" ]]; then
    kdVersion=$(curl https://api.github.com/repos/UKHomeOffice/kd/releases/latest | jq -r '.tag_name')
  else
    kdVersion="${INPUT_KD_VERSION}"
  fi
}

function setup_github_bin() {
  mkdir -p ${GITHUB_BIN}
}

function install_kd() {
  kdDownloadUrl="https://github.com/UKHomeOffice/kd/releases/download/${kdVersion}/kd_linux_amd64"
  wget ${kdDownloadUrl} -O /tmp/kd
  chmod +x /tmp/kd
  mv /tmp/kd ${GITHUB_BIN}
}

#######################################
# Script
#######################################
parse_verion
setup_github_bin
install_kd