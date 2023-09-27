#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

separator
echo "Building openfhe-development with CC=$CC CXX=$CXX CMAKE_FLAGS=$CMAKE_FLAGS"
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

if [ "x$OPENFHE_INSTALL_DIR" = "x" ]; then
  OPENFHE_INSTALL_DIR=$ROOT/openfhe-staging/install
fi
echo "OPENFHE_INSTALL_DIR set to $OPENFHE_INSTALL_DIR"
cmake $CMAKE_FLAGS -DCMAKE_INSTALL_PREFIX=$OPENFHE_INSTALL_DIR .. || abort "Failure of cmake in openfhe-development."

CPUS=`lscpu | egrep "^CPU\(s\)" | awk '{print $2}'`
if [ $CPUS -lt 1 ]; then
  CPUS=1
fi

separator
echo "Making openfhe-development with CC=$CC CXX=$CXX CMAKE_FLAGS=$CMAKE_FLAGS and $CPUS cpus."
echo
make -j $CPUS || abort "Build of openfhe-development failed."

separator
echo "Building openfhe-development with CC=$CC CXX=$CXX CMAKE_FLAGS=$CMAKE_FLAGS [COMPLETE]"
echo
