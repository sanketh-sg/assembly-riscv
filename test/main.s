#
# Copyright 2023 inpyjama.com. All Rights Reserved.
# Author: Piyush Itankar <piyush@inpyjama.com>
# PC points to first instruction in the file i,e _start
# A breakpoint is added to halt the CPU and exe code line by line using GDB

_start:
  addi x1, x0, 20
