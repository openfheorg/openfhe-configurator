#!/bin/sh

CMAKE_FLAGS="-DWITH_INTEL_HEXL=ON -DINTEL_HEXL_PREBUILT=ON -DWITH_NATIVEOPT=ON" ./scripts/build-openfhe-development.sh
