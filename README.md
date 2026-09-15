# Compiler optimization comparison and analysis
## Based on the June 1988 PC Tech Journal optimizing compiler benchmark

Insert better introduction here later

## Software used

## Build and run

Everything is built using `make` (GNU make is the target in particular).

**To build the benchmarks, you are required to have the original `optbench.c` file as provided in Listing 1 in *"Highly polished C code", Philip N. Hisley, PC Tech Journal, Volume 6, Number 6 (June 1988)***. This file is not included here as it is protected by copyright.

After sourcing the file, either put it into the root of this project or specify its location in your filesystem by specifying the `OPTBENCH` makefile variable.

The makefile assumes you have the `gcc`, `clang` and `ccomp` (CompCert) compiler binaries as well as the `patch` utility binary in your PATH environment variable. If that is not the case, specify the file path by setting the `GCC`, `CLANG`, `COMPCERT` and/or `PATCH` makefile variable(s) respectively.

Then just run `make` and you will get the necessary executable and assembly files in the `build/<compiler name>` folder.
    
## Acknowledgements

## Authors
