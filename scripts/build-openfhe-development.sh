#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

separator
echo "Building openfhe-development with cc $CC cxx $CXX cmake flags $CMAKE_FLAGS"
echo

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

cmake $CMAKE_FLAGS .. || abort "Failure of cmake in openfhe-development."

CPUS=14
#CPUS=`lscpu | egrep "^CPU\(s\)" | awk '{print $2}'`
#if [ $CPUS -lt 1 ]; then
#  CPUS=1
#fi

separator
echo "Making openfhe-development with CC=$CC CXX=$CXX CMAKE_FLAGS=$CMAKE_FLAGS and $CPUS cpus."
echo
make -j$CPUS || abort "Build of openfhe-development failed."


separator
echo "Building openfhe-development with cc $CC cxx $CXX cmake flags $CMAKE_FLAGS succeeded."
echo
