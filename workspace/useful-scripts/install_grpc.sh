#!/bin/bash

GRPC_VERSION=1.29.x
git clone https://github.com/grpc/grpc.git --recursive --depth=1 --branch=v$GRPC_VERSION

pushd grpc
    #-D gRPC_PROTOBUF_PROVIDER=package \
    #-D gRPC_ZLIB_PROVIDER=package \
    #-D gRPC_CARES_PROVIDER=package \
    #-D gRPC_SSL_PROVIDER=package \
    #-D protobuf_WITH_ZLIB=ON \
cmake -G Ninja \
    -D gRPC_PROTOBUF_PROVIDER=package \
    -D gRPC_INSTALL=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_SHARED_LIBS=OFF \
    -D CMAKE_CXX_FLAGS=-Wno-error=attributes \
    -D gRPC_BUILD_TESTS=OFF \
    -B build

ninja -C build
sudo ninja -C build install
popd
