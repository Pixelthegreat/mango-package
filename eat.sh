#!/bin/bash

# extract archive
tar -xf mango.tar.gz -C eat/

# move source directory
cd eat
mv -v mango-* mango-${MANGO_VERSION}
cd mango-${MANGO_VERSION}

# compile project
make

cd ..

# copy executable #
cp -v mango-${MANGO_VERSION}/mango mango/bin/

# create package #
./eat-create mango

# move package and remove redundant files #
mv -v ./mango.tar.gz ../mango-eat-${MANGO_VERSION}.tar.gz
cd ..

rm eat/mango/bin/*
