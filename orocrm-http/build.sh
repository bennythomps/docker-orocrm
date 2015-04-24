#!/bin/bash
pwd=$(pwd)
cd $(dirname $(readlink -f $0))
docker build -t oro/crm-debian-http .
cd ${pwd}
