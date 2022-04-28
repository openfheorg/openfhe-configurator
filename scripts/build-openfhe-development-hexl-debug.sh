#!/bin/sh

CMAKE_FLAGS="-DWITH_INTEL_HEXL=ON -DWITH_NATIVEOPT=ON -DCMAKE_BUILD_TYPE=Debug" ./scripts/build-openfhe-development.sh
