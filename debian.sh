#!/bin/bash
cp -v mango.tar.gz mango_${MANGO_VERSION}.orig.tar.gz

tar -xf mango_${MANGO_VERSION}.orig.tar.gz

mv -v ./mango-* ./mango-${MANGO_VERSION}

# copy "debian" directory
cp -rv ./debian ./mango-${MANGO_VERSION}/debian
cp -v ./mango_${MANGO_VERSION}.orig.tar.gz ./mango-${MANGO_VERSION}/

# cd to source dir; the wildcard is there for the fact that the source directory name could change beyond "mango-", due to the naming scheme that github uses
cd mango-${MANGO_VERSION}

# create changelog file #
dch --create -M -v ${MANGO_VERSION}-1 --package mango

# remove tar.gz file that got there #
rm ./mango_${MANGO_VERSION}.orig.tar.gz

# build package #
cd debian
debuild -us -uc
cd ../..

# remove source directory #
rm -r mango-${MANGO_VERSION} mango_${MANGO_VERSION}.orig.tar.gz
