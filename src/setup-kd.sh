#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

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

function install_kd() {
  kdDownloadUrl="https://github.com/UKHomeOffice/kd/releases/download/${kdVersion}/kd_linux_amd64"
  wget ${kdDownloadUrl} -O /tmp/kd_linux_amd64
  chmod +x /tmp/kd_linux_amd64
  mv /tmp/kd_linux_amd64 /usr/local/bin/kd
}

#######################################
# Script
#######################################
parse_verion
install_kd