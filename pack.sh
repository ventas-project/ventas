#!/bin/sh
coin=ventas
version=1.0.0
platform=`uname -a | awk '{print tolower($1)}'`
arch=`uname -m`

if [ "${platform}" == "linux" ]; then
    if [ "${arch}" == "x86_64" ]; then
        tarball_name="bitcoin-${version}-linux64.tar.gz"
    elif [ "${arch}" == "x86_32" ]; then
        tarball_name="bitcoin-${version}-linux32.tar.gz"
    fi
elif [ "${platform}" == "darwin" ]; then
    tarball_name="bitcoin-${version}-osx64.tar.gz"
else
    echo "Bitcoin binary distribution not available for platform and architecture"
    exit -1
fi
bitcoin_dir=bitcoin-${version}
rm -Rf tmp/*
rm -Rf ${tarball_name}

mkdir -p tmp/${bitcoin_dir}/bin

cp src/${coin}-cli          tmp/${bitcoin_dir}/bin/bitcoin-cli
cp src/${coin}-tx           tmp/${bitcoin_dir}/bin/bitcoin-tx
cp src/${coin}d             tmp/${bitcoin_dir}/bin/bitcoind
cp src/test/test_bitcoin    tmp/${bitcoin_dir}/bin/test_bitcoin
cp src/wallet-utility       tmp/${bitcoin_dir}/bin/
cp src/qt/${coin}-qt        tmp/${bitcoin_dir}/bin/bitcoin-qt
cd tmp
tar -zcvf ../${tarball_name} ./
cd ../
