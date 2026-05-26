ifeq ($(COMPILER),)
$(error Compiler not specified, this makefile is not being called correctly)
endif

build_all: build/$(COMPILER) exec_noopt exec_speed exec_size asm_speed asm_size

build/$(COMPILER):
	mkdir build/$(COMPILER)

exec_noopt: build/$(COMPILER)/exec_noopt
exec_speed: build/$(COMPILER)/exec_speed
exec_size: build/$(COMPILER)/exec_size
asm_speed: build/$(COMPILER)/speed.s
asm_size: build/$(COMPILER)/size.s

%_noopt: CFLAGS = -O0
%_speed: CFLAGS = -O2
%_size: CFLAGS = -Os

build/$(COMPILER)/exec_%: build/optbench_exec.c
	$(COMPILER) $(CFLAGS) -o $@ $^

build/$(COMPILER)/%.s: $(OPTBENCH)
	$(COMPILER) -S $(CFLAGS) -o $@ $^

.PHONY: build_all exec_noopt exec_speed exec_size asm_speed asm_size
