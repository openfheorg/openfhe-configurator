#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

$ROOT/scripts/stage-openfhe-development.sh || abort "Unable to stage openfhe-development [hexl-enabled]."

cd $ROOT/repos/openfhe-hexl || abort "Unable to enter openfhe-hexl directory."
scripts/stage-openfhe-development-hexl.sh || abort "Unable to stage openfhe-hexl into openfhe-development."

separator
echo "Build [hexl-enabled] is staged."
echo "You may now run scripts/build-openfhe-development-hexl.sh to perform a hexl-enabled build."
echo

