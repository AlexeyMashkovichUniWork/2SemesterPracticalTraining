# Compiler optimization comparison and analysis
## Based on the June 1988 PC Tech Journal optimizing compiler benchmark

This repository is comprised of the files necessary to measure the comparative performance of some of the top-of-the-line compilers available today using the benchmark provided in Volume 6, Number 6 (June 1988 issue) of the PC Tech Journal.

The benchmark was initially intended to be compiled to assembly code to be analyzed by hand; however this repository provides a patch file that makes it a reasonable *executable* benchmark - the resulting executable files measure pure CPU time without any unnecessary kernel / routine / IO overhead.

For each of the 3 compilers, 5 types of files are compiled:

- Patched executable file, no optimizations
- Patched executable file, optimized for speed
- Patched executable file, optimized for size
- Assembly code, no optimizations
- Assembly code, optimized for speed

## Software used

Compilers/toolchains being benchmarked in this suite:

- The [GNU Compiler Collection](https://gcc.gnu.org) and its C Frontend in particular
- The [Clang](https://clang.llvm.org)-[LLVM](https://www.llvm.org) toolchain
- [CompCert](https://compcert.org/compcert-C.html)

Tools necessary to build the benchmarks:

- [GNU Make](https://www.gnu.org/software/make)
- [GNU Patch](https://savannah.gnu.org/projects/patch)

## Build and run

Everything is built using `make` (GNU make is the target in particular).

**To build the benchmarks, you are required to have the original `optbench.c` file as provided in Listing 1 in *"Highly polished C code", Philip N. Hisley, PC Tech Journal, Volume 6, Number 6 (June 1988)***. This file is not included here as it is protected by copyright.

After sourcing the file, either put it into the root of this project or specify its location in your filesystem by specifying the `OPTBENCH` makefile variable.

The makefile assumes you have the `gcc`, `clang` and `ccomp` (CompCert) compiler binaries as well as the `patch` utility binary in your PATH environment variable. If that is not the case, specify the file path by setting the `GCC`, `CLANG`, `COMPCERT` and/or `PATCH` makefile variable(s) respectively.

Then just run `make` and you will get the necessary executable and assembly files in the `build/<compiler name>` folder.
    
## Acknowledgements

The original article which the benchmark code is presented in was written by *Philip N. Hisley*.

The original benchmark code (not present in this repository) is *Copyright (c) 1988 Ziff-Davis Publishing Company*.

The benchmarks actually executed in the aforementioned article are a completely different set of benchmarks intended for running on DOS.
