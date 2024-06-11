#
# Copyright 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
# Place to automate the commands instead of remembering a lengthy cmd
# you can just right them here

TOOLCHAIN_PREFIX ?= riscv64-unknown-elf-

OBJCOPY           = $(TOOLCHAIN_PREFIX)objcopy
LD                = $(TOOLCHAIN_PREFIX)ld
AS                = $(TOOLCHAIN_PREFIX)as
GCC               = $(TOOLCHAIN_PREFIX)gcc

all: main.s
	$(GCC)  -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tmain.ld main.s -o main.elf
	$(OBJCOPY) -O binary main.elf main.bin
	xxd -e -c 4 -g 4 main.bin
# feed the main.s file to assembler to generate an ELF
# the ELF contains instructions hidden alondside of headers objcopy to strip away the unwanted headers
# once we get the encoded binary instruction we convert it to hexa format
debug:
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel main.elf -gdb tcp::1234

gdb:
	gdb-multiarch main.elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

.PHONY: clean
clean:
	rm -rf *.o *.elf *.bin *.out .gdb_history
