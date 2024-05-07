#!/bin/sh
set -eu

ZIP_FILE=$(basename  ${1})
unzip ${ZIP_FILE}
DIR=${ZIP_FILE%%.zip}
for exe in ${DIR}/SilKit/bin/*
do
    install -m 755 ${exe} /usr/bin/
done
cp -R ${DIR}/SilKit/include/silkit /usr/include/

for lib in ${DIR}/SilKit/lib/*.so; 
do
    install -m 755 ${lib} /usr/lib/
done
install -d /usr/lib/cmake
cp -R ${DIR}/SilKit/lib/cmake/SilKit /usr/lib/cmake
rm -rf "${DIR}"
echo DONE
    
