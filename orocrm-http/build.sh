#!/bin/bash
docker build -t oro/crm-debian-http -f $(dirname $(readlink -f $0))/Dockerfile
