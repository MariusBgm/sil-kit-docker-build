#!/bin/sh
set -eu

ZIP_FILE=$(basename  ${1})
unzip ${ZIP_FILE}
DIR=${ZIP_FILE%%.zip}

#build demos
(
    cd $DIR/SilKit-Demos
    cmake -B _build -D CMAKE_BUILD_TYPE=Release
    cmake --build _build --parallel
)

for exe in ${DIR}/SilKit/bin/*
do
    echo "Installing $(basename ${exe}) to /usr/bin"
    install -m 755 ${exe} /usr/bin/
done
cp -R ${DIR}/SilKit/include/silkit /usr/include/


for lib in ${DIR}/SilKit/lib/*.so; 
do
    echo "Installing $(basename ${lib}) to /usr/lib"
    install -m 755 ${lib} /usr/lib/
done
install -d /usr/lib/cmake
cp -R ${DIR}/SilKit/lib/cmake/SilKit /usr/lib/cmake
rm -rf "${DIR}"
echo DONE
    
