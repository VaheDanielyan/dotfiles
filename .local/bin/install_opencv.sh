#!/bin/bash
### Install OpenCV

OPENCV_VERSION=4.5.0

wget https://github.com/opencv/opencv/archive/$OPENCV_VERSION.zip
unzip $OPENCV_VERSION.zip
rm $OPENCV_VERSION.zip

wget https://github.com/opencv/opencv_contrib/archive/$OPENCV_VERSION.zip
unzip $OPENCV_VERSION.zip
rm $OPENCV_VERSION.zip

pushd opencv-$OPENCV_VERSION/

    #-D GLIBCXX_USE_CXX11_ABI=0 \
    #-D CUDA_ARCH_BIN="3.0, 3.5, 3.7, 5.0, 5.2, 6.0, 6.1, 7.0" \
    #-D WITH_CUDA=ON \
    #-D WITH_CUBLAS=ON \
    #-D CUDA_ARCH_BIN="6.1" \
    #-D BUILD_opencv_dnn=ON \
    #-D CUDA_ARCH_PTX="" \
    #-D WITH_PROTOBUF=ON \
    #-D PROTOBUF_UPDATE_FILES=ON \
    #-D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.8.so \

cmake -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_opencv_dnn=OFF \
    -D BUILD_PROTOBUF=OFF \
    -D WITH_PROTOBUF=ON \
    -D PROTOBUF_UPDATE_FILES=ON \
    -D WITH_EIGEN=ON \
    -D WITH_OPENGL=ON \
    -D WITH_OPENCL=ON \
    -D BUILD_TIFF=ON \
    -D WITH_IPP=OFF \
    -D WITH_TBB=ON \
    -D WITH_V4L=ON \
    -D ENABLE_VFPV3=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D BUILD_SHARED_LIBS=OFF \
    -D WITH_LIBV4L=ON \
    -D BUILD_opencv_python3=ON \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_java=OFF \
    -D WITH_GSTREAMER=ON \
    -D WITH_GTK=ON \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D WITH_FFMPEG=1 \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D OPENCV_EXTRA_MODULES_PATH=`pwd`/../opencv_contrib-$OPENCV_VERSION/modules \
    -B build 

ninja -C build
sudo ninja -C build install
popd
