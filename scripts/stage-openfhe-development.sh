#!/bin/sh

. ./scripts/functions.sh
. ./scripts/vars.sh

ROOT=`pwd`

mkdir openfhe-staging > /dev/null 2>&1
cd $ROOT/openfhe-staging || abort "Unable to create repos directory."

if [ ! -d openfhe-development ]; then
  separator
  echo "Cloning openfhe-development repository."
  echo
  git clone https://github.com/openfheorg/openfhe-development.git
fi

separator
echo "Switching to branch openfhe-development $OPENFHE_DEVELOPMENT_BRANCH."
echo
cd $ROOT/openfhe-staging/openfhe-development || abort "Clone of openfhe-development failed."
git checkout main || abort "Checkout of openfhe-hexl main failed."
git pull || abort "Pull of the openfhe-development failed."
git checkout $OPENFHE_DEVELOPMENT_BRANCH || abort "Checkout of openfhe-development branch $OPENFHE_DEVELOPMENT_BRANCH failed."
separator
echo "Status of branch openfhe-development $OPENFHE_DEVELOPMENT_BRANCH."
echo
git status

exit

separator
echo "Staging [default] build."
echo
cd $ROOT
if [ -d ./openfhe-staging ]; then
  rm -rf ./openfhe-staging
fi
mkdir $ROOT/openfhe-staging > /dev/null 2>&1
cd $ROOT/openfhe-staging || abort "Unable to create openfhe staging directory."
cp -r $ROOT/openfhe-staging/openfhe-development/ .

separator
echo "Build [default] is staged."
echo "You may now run scripts/build-openfhe-development.sh to perform a default build."
echo

