#!/bin/bash
DIR=$(dirname $(readlink -f $0))
if ${DIR}/orocrm-root/build.sh; then
  if ${DIR}/orocrm-base/build.sh; then
    ${DIR}/orocrm-http/build.sh
  fi
fi
