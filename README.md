# OpenFHE Configurator

Use this repository to configure and build OpenFHE for supported hardware acceleration modes.

# How To Use

```
% git clone https://github.com/openfheorg/openfhe-configurator.git
% cd openfhe-configurator
% scripts/configure.sh

OpenFHE configurator

Would you like an OpenFHE Release build? [y/n] : n
Would you like a HEXL build?             [y/n] : y

===============================================================================

Switching to branch openfhe-development main.

Already on 'main'
Your branch is up to date with 'origin/main'.

===============================================================================

Status of branch openfhe-development main.

On branch main 
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean

===============================================================================

Staging [default] build.


===============================================================================

Build [default] is staged.
You may now run scripts/build-openfhe-development.sh to perform a default build.


===============================================================================

Build [hexl-enabled] is staged.
You may now run scripts/build-openfhe-development.sh to perform a hexl-enabled build.

% scripts/build-openfhe-development.sh
[ OpenFHE HEXL-enabled build commences]
```

By default, the `openfhe` and `HEXL` libraries will be installed at `openfhe-configurator/openfhe-staging/install'.
If you want to change the istall location, pass an 'OPENFHE_INSTALL_DIR' value to each script e.g.,

```
% OPENFHE_INSTALL_DIR=/usr/local scripts/configure.sh
% OPENFHE_INSTALL_DIR=/usr/local scripts/build-openfhe-development.sh
```

If you want to change OpenFHE build paramaters, pass those changes to `build-openfhe-development.sh` as 'CMAKE_FLAGS' e.g.,

```
% CMAKE_FLAGS="-DWITH_OPENMP=OFF -DCMAKE_BUILD_TYPE=Debug" scripts/build-openfhe-development.sh
```

# Supported Configurations

At current time, the following build types are supported:

|backend|development|release|
|:--- | :---: | :---: |
|default|X||
|HEXL-enabled|X||

# For More Information

Please see [OpenFHE Development](https://github.com/openfheorg/openfhe-development)
