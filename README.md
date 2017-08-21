# stackage2nix examples

[![Build Status](https://travis-ci.org/4e6/stackage2nix-examples.svg?branch=master)](https://travis-ci.org/4e6/stackage2nix-examples)

Repository is used to check `stackage2nix` correctness against various projects.
See build scripts for details.

## Build

Clone with submodules:

```
git clone --recursive https://github.com/4e6/stackage2nix-examples.git
```

Build specific project:

```
./stackage2nix-test <project> [--dry-run]
```

Examples:

```
./stackage2nix-test stack --dry-run
./stackage2nix-test path
```
