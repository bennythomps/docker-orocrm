#!/bin/bash
DIR=$(dirname $(readlink -f $0))
${DIR}/orocrm-root/build.sh
${DIR}/orocrm-base/build.sh
${DIR}/orocrm-http/build.sh
