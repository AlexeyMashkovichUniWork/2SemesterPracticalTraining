ifeq ($(COMPILER),)
$(error Compiler not specified, this makefile is not being called correctly)
endif

# GCC and Clang both do support this flag
ifneq ($(COMPILER),ccomp)
NO_LTO = -fno-lto
endif

# GCC supports this flag, in Clang 19 it is a no-op
ifneq ($(COMPILER),ccomp)
	ASMFLAGS = -fverbose-asm
endif

build_all: exec_noopt exec_speed exec_size asm_speed asm_size

build/$(COMPILER):
	mkdir build/$(COMPILER)

build/$(COMPILER)/tmp: | build/$(COMPILER)
	mkdir build/$(COMPILER)/tmp

exec_noopt: build/$(COMPILER)/exec_noopt
exec_speed: build/$(COMPILER)/exec_speed
exec_size: build/$(COMPILER)/exec_size
asm_speed: build/$(COMPILER)/speed.s
asm_size: build/$(COMPILER)/size.s

%_noopt: CFLAGS = -O0
%_noopt: BUILD_TYPE = NOOPT
%_speed: CFLAGS = -O2
%_speed: BUILD_TYPE = SPEED
%_size: CFLAGS = -Os
%_size: BUILD_TYPE = SIZE

build/$(COMPILER)/tmp/exec_%.o: build/optbench_exec.c | build/$(COMPILER)/tmp
	$(COMPILER) -c $(CFLAGS) $(NO_LTO) -I "$(CURDIR)" -DNO_ZERO_DIVIDE -DCOMPILER_TYPE=\"$(COMPILER_TYPE)\" -DBUILD_TYPE=\"$(BUILD_TYPE)\" -o $@ $<

build/$(COMPILER)/tmp/%.o: %.c | build/$(COMPILER)/tmp
	$(COMPILER) -c $(CFLAGS) -o $@ $<

build/$(COMPILER)/exec_%: build/$(COMPILER)/tmp/exec_%.o build/$(COMPILER)/tmp/storage_function.o
	$(COMPILER) $(CFLAGS) $(NO_LTO) -o $@ $^

build/$(COMPILER)/%.s: $(OPTBENCH) | build/$(COMPILER)
	$(COMPILER) -S $(CFLAGS) $(ASMFLAGS) -o $@ $<

.PHONY: build_all exec_noopt exec_speed exec_size asm_speed asm_size
