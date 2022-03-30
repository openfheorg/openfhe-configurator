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

Switching to branch openfhe-development 2022-02-22-jbates-hexl-split-take-3.

Already on '2022-02-22-jbates-hexl-split-take-3'
Your branch is up to date with 'origin/2022-02-22-jbates-hexl-split-take-3'.

===============================================================================

Status of branch openfhe-development 2022-02-22-jbates-hexl-split-take-3.

On branch 2022-02-22-jbates-hexl-split-take-3
Your branch is up to date with 'origin/2022-02-22-jbates-hexl-split-take-3'.

nothing to commit, working tree clean

===============================================================================

Staging [default] build.


===============================================================================

Build [default] is staged.
You may now run scripts/build-openfhe-development.sh to perform a default build.


===============================================================================

Build [hexl-enabled] is staged.
You may now run scripts/build-openfhe-development-hexl.sh to perform a hexl-enabled build.

% scripts/build-openfhe-development-hexl.sh
[ OpenFHE HEXL-enabled build commences]
```

# Supported Configurations

At current time, the following build types are supported:

|backend|development|release|
|:--- | :---: | :---: |
|default|X||
|HEXL-enabled|X||

# For More Information

Please see [OpenFHE Development](https://github.com/openfheorg/openfhe-development)
