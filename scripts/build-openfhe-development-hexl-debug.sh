#!/bin/sh

CMAKE_FLAGS="-DWITH_INTEL_HEXL=ON -DNATIVEOPT=ON -DCMAKE_BUILD_TYPE=Debug" ./scripts/build-openfhe-development.sh
