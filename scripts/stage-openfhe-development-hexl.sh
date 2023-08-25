#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

$ROOT/scripts/stage-openfhe-development.sh || abort "Unable to stage openfhe-development [hexl-enabled]."

if [ ! -d $ROOT/repos/openfhe-hexl ]; then
  cd $ROOT/repos || abort "Unable to enter the repos directory."
  git clone https://github.com/openfheorg/openfhe-hexl.git || abort "Unable to clone the openfhe-hexl repository."
fi

separator
echo "Switching to branch openfhe-hexl $OPENFHE_HEXL_BRANCH."
echo
cd $ROOT/repos/openfhe-hexl || abort "Clone of openfhe-hexl failed."
git checkout main || abort "Checkout of openfhe-hexl main failed."
git pull || abort "Pull of the openfhe-hexl failed."
git checkout $OPENFHE_HEXL_BRANCH || abort "Checkout of openfhe-hexl branch $OPENFHE_HEXL_BRANCH failed."
separator
echo "Status of branch openfhe-hexl $OPENFHE_HEXL_BRANCH."
echo
git status

scripts/stage-openfhe-development-hexl.sh || abort "Unable to stage openfhe-hexl into openfhe-development."

separator
echo "Build [hexl-enabled] is staged."
echo "You may now run scripts/build-openfhe-development-hexl.sh to perform a hexl-enabled build."
echo
