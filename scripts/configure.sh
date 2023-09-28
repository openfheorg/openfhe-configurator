#!/bin/sh

. ./scripts/vars.sh
. ./scripts/functions.sh

ROOT=`pwd`

echo
echo "OpenFHE configurator"
echo

if [ -d ./openfhe-staging ]; then
  read -p "A previous staging directory exists, delete? [y/n] : " yn
  case $yn in
    [Nn]* ) echo; echo "Unwilling to proceed - aborting."; exit 1; break;;
  esac
  rm -rf ./openfhe-staging
fi

if [ "x$OPENFHE_INSTALL_DIR" = "x" ]; then
  OPENFHE_INSTALL_DIR=$ROOT/openfhe-staging/install
fi

read -p "Would you like to stage an openfhe-development build?     [y/n] : " yn
case $yn in
  [Yy]* ) OPENFHE_INSTALL_DIR=$OPENFHE_INSTALL_DIR $ROOT/scripts/stage-openfhe-development.sh; exit 1; break;;
esac

read -p "Would you like to stage an openfhe-hexl build?            [y/n] : " yn
case $yn in
  [Yy]* ) OPENFHE_INSTALL_DIR=$OPENFHE_INSTALL_DIR $ROOT/scripts/stage-openfhe-development-hexl.sh; exit 1; break;;
esac
