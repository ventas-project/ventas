#!/bin/sh
#!/bin/sh
coin=ventas
version=1.0.0
platform=`uname -a | awk '{print tolower($1)}'`

platform2=`uname -r`
arch=`uname -m`
ext=
# options
#options=" -reindex"
options=
printc=

if [ "${platform}" == "linux" ] || [ "${platform}" == "Linux" ]; then
    printc='-printtoconsole'
    ext=''
    if [ "${platform2}"=="4.4.0-43-Microsoft" ]; then
        ext='.exe'
    fi
elif [ "${platform}" == "darwin" ]; then
    printc='-printtoconsole'
    ext=''
else
    printc=''
    ext='.exe'
fi

src/qt/ventas-qt${ext} -datadir=./data  ${printc} ${options}

