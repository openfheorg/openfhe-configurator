#!/bin/sh

CMAKE_FLAGS="-DWITH_NATIVEOPT=ON -DINTEL_HEXL_PREBUILT=ON -DCMAKE_BUILD_TYPE=Debug" ./scripts/build-openfhe-development.sh
