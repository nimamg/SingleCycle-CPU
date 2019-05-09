# SingleCycle-CPU
A single cycle CPU, simulated using Verilog

This cpu has 8 16-bit registers, which can be accessed through 4 windows including 4 registers each (The windows overlap each other.)
It can address and use 1K * 16-bit memory units as data or instruction memory.
The instruction set consists of 19 16-bit instructions, with 4 bit opcodes. (Instruction set included.)
The register windows are as followed:
  Window 1: R0 - R3
  Window 2: R2 - R5
  Window 3: R4 - R7
  Window 4: R6 - R1
  
It has a little bug, for the cpu to function, you should always reset the cpu before doing anything, and after the reset, the first
instruction should be a window select instruction as it doesn't have a default window.
