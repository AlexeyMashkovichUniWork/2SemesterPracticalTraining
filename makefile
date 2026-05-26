GCC ?= gcc
CLANG ?= clang
COMPCERT ?= ccomp

PATCH ?= patch

OPTBENCH ?= optbench.c

COMPILER ?= NULL

build_all: build/optbench_exec.c build_gcc build_clang build_compcert

build/optbench_exec.c: build optbench_exec.patch optbench.c
	$(PATCH) $(OPTBENCH) optbench_exec.patch -o build/optbench_exec.c

build:
	mkdir build

.PHONY: build_all build_gcc build_clang build_compcert
