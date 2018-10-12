#!/bin/bash

export CFLAGS="${CFLAGS} -I/usr/include"
export CXXFLAGS="${CXXFLAGS} -I/usr/include"

export CMAKE_CONFIG="Release"

mkdir "build_${PKG_NAME}_${CMAKE_CONFIG}"
pushd "build_${PKG_NAME}_${CMAKE_CONFIG}"

cmake \
    -G "Unix Makefiles" \
    -D CMAKE_BUILD_TYPE:STRING="${CMAKE_CONFIG}" \
    -D CMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -D realsense2_DIR:PATH="${REALSENSE2_DIR}" \
    "${SRC_DIR}/rs_bag2image"
make
make install

popd
