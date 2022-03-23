#!/bin/sh

. ./scripts/vars.sh
. ./scripts/functions.sh

OPENFHE_DEVELOPMENT_REPO="openfhe-development"
OPENFHE_REPO="openfhe-development"
OPENFHE_HEXL=""

ROOT=`pwd`

echo
echo "OpenFHE configurator"
echo
read -p "Would you like an OpenFHE Release build? [y/n] : " yn
case $yn in
  [Yy]* ) OPENFHE_REPO="openfhe-release"; break;;
esac

read -p "Would you like a HEXL build?             [y/n] : " yn
case $yn in
  [Yy]* ) OPENFHE_HEXL="openfhe-hexl"; break;;
esac

if [ "x$OPENFHE_HEXL" = "x" ]; then
  if [ "$OPENFHE_REPO" = "$OPENFHE_DEVELOPMENT_REPO" ]; then
    $ROOT/scripts/stage-openfhe-development.sh
  else
    echo "Unsupported build type."
  fi
else
  $ROOT/scripts/stage-openfhe-development-hexl.sh
fi

