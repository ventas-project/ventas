#!/bin/sh
# deploy.sh root@data003.etra.kr:/home/etra/ventas/
./pack.sh
scp tmp/ventas-1.0.0/bin/* $1
