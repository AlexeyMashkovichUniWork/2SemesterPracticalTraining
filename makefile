GCC ?= gcc
CLANG ?= clang
COMPCERT ?= ccomp

PATCH ?= patch

OPTBENCH ?= optbench.c

COMPILER ?= NULL

build_all: build/optbench_exec.c build_gcc build_clang build_compcert

build/optbench_exec.c: build optbench_exec.patch $(OPTBENCH)
	$(PATCH) $(OPTBENCH) optbench_exec.patch -o build/optbench_exec.c

$(OPTBENCH):
	$(error This repository requires the optbench.c file, which is \
		Listing 1 in "Highly polished C code", Philip N. Hisley, \
		PC Tech Journal, Volume 6, Number 6 (June 1988). If you have \
		it in a custom location, please set the OPTBENCH variable to \
		its location)

build:
	mkdir build

.PHONY: build_all build_gcc build_clang build_compcert
