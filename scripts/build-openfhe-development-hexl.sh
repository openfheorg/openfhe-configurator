#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

cd $ROOT/openfhe-staging/openfhe-development || abort "The build has not been staged yet."

if [ ! -d build ]; then
  mkdir build || abort "Unable to create openfhe-development build directory."
fi
cd $ROOT/openfhe-staging/openfhe-development/build || abort "Unable to enter openfhe-development build directory."

if [ -f Makefile ]; then
  separator
  echo "Cleaning openfhe-development build."
  echo
  make clean
fi

cmake -DWITH_INTEL_HEXL=ON .. || abort "Failure of cmake in openfhe-development."

CPUS=`lscpu | egrep "^CPU\(s\)" | awk '{print $2}'`
if [ $CPUS -lt 1 ]; then
  CPUS=1
fi

separator
echo "Building openfhe-development with -j$CPUS."
echo
make -j$CPUS || abort "Build of openfhe-development failed."


separator
echo "Building openfhe-development succeeded."
echo
