#!/bin/bash
docker build -t oro/crm-debian-base -f $(dirname $(readlink -f $0))/Dockerfile
