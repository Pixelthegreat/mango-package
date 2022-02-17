#!/bin/bash

# extract archive
tar -xf mango.tar.gz -C eat/

# move source directory
cd eat
mv -v mango-* mango-${MANGO_VERSION}
cd mango-${MANGO_VERSION}

# compile project
./configure.sh
make

cd ..

# copy executable, and other files #
cp -v mango-${MANGO_VERSION}/mango mango/bin/
cp -v mango-${MANGO_VERSION}/LICENSE.txt mango/

# add version number #
cp -v mango/package.conf backup.conf
echo -e ${MANGO_VERSION} | tee -a mango/package.conf

# create package #
./eat-create mango

# restore backup conf #
rm -f mango/package.conf
mv -v backup.conf mango/package.conf

# move package and remove redundant files #
mv -v ./mango.tar.gz ../mango-eat-${MANGO_VERSION}.tar.gz
cd ..

rm eat/mango/bin/*
