#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

cd $ROOT/openfhe-staging/openfhe-development || abort "The [hexl-enabled] build has not been staged yet."

if [ ! -d build ]; then
  mkdir build || abort "Unable to create openfhe-development [hexl-enabled] build directory."
fi
cd $ROOT/openfhe-staging/openfhe-development/build || abort "Unable to enter openfhe-development [hexl-enabled] build directory."

if [ -f Makefile ]; then
  separator
  echo "Cleaning openfhe-development [hexl-enabled] build."
  echo
  make clean
fi

cmake -DWITH_INTEL_HEXL=ON .. || abort "Failure of cmake in openfhe-development [hexl-enabled]."

CPUS=`lscpu | egrep "^CPU\(s\)" | awk '{print $2}'`
if [ $CPUS -lt 1 ]; then
  CPUS=1
fi

separator
echo "Building openfhe-development [hexl-enabled] with -j$CPUS."
echo
make -j$CPUS || abort "Build of openfhe-development [hexl-enabled] failed."


separator
echo "Building openfhe-development [hexl-enabled] succeeded."
echo
