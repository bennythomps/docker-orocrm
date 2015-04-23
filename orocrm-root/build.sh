#!/bin/bash
docker build -t oro/crm-debian-root -f $(dirname $(readlink -f $0))/Dockerfile
