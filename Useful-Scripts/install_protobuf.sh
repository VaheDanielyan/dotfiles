#!/bin/bash

### Install ProtoBuf
PROTOBUF_VERSION=3.11.2
wget https://github.com/protocolbuffers/protobuf/archive/v$PROTOBUF_VERSION.tar.gz
tar xf v$PROTOBUF_VERSION.tar.gz
rm v$PROTOBUF_VERSION.tar.gz

pushd protobuf-$PROTOBUF_VERSION
./autogen.sh
./configure
make -j4
#make check
sudo make install
sudo ldconfig # refresh shared library cache.
popd

