#!/bin/bash
for i in {1..100} 
do
	echo "gen $i"
	./src/ventas-cli.exe -datadir=./data generate 1

done
