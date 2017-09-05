#!/bin/sh
timestamp=$( date +%Y%m%d-%H%M%S )
echo $timestamp
cp data/wallet.dat ./wallet.dat.$timestamp
rm -Rf ./data/*
cp *.conf ./data/
cp ./wallet.dat.$timestamp ./data/wallet.dat
