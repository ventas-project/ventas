#!/bin/bash

#if [ $# -lt 2 ]; then
#    echo "usage gitdir srcdir "
#    exit 0;
#fi
tarname=temp.tar
# delete file
rm -Rf $tarname
orgdir=`pwd`
gitdir=~/dev/blockchain/github/ventas-project/ventas
srcdir=./

# copy to gitdir

echo gitdir $gitdir
echo srcdir $srcdir
echo orgdir $orgdir

tar cvf $tarname \
    --exclude=data \
    --exclude=.git \
    --exclude=etra \
    --exclude=tmp \
    --exclude=depends/work \
    --exclude=depends/built \
    --exclude=depends/sources \
    --exclude=depends/x86_64-apple-darwin11* \
    --exclude=**.o \
    --exclude=**.a \
    --exclude=**.dmg \
    --exclude=wallet.dat** \
    --exclude=Ventas-Qt.app \
    *

# rm -Rf $gitdir/*
mv $tarname $gitdir
cd $gitdir

tar xvf $tarname
rm $tarname
