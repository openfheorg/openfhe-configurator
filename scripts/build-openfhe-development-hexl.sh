#!/bin/sh

CMAKE_FLAGS="-DWITH_INTEL_HEXL=ON -DINTEL_HEXL_PREBUILT=ON -DWITH_NATIVEOPT=ON -DCMAKE_CROSSCOMPILING=1 -DRUN_HAVE_STD_REGEX=0 -DRUN_HAVE_POSIX_REGEX=0" ./scripts/build-openfhe-development.sh
