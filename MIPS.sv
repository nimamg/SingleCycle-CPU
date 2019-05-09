`timescale 1ns/1ns

module MIPS(input clk, rst);
    wire[2:0] ALUOP;
    wire[1:0] PCSel, ALUSel;
    wire dataSel, regWriteEn, memWriteEn, changeWnd, zero;
    wire[3:0] opcode;
    wire[7:0] func;
    dataPath mod1(ALUOP, PCSel, ALUSel, dataSel, regWriteEn, memWriteEn, changeWnd, clk, rst, opcode, func, zero);
    ctrlr mod2(clk, zero, func, opcode, PCSel, ALUSel, dataSel, regWriteEn, memWriteEn,changeWnd, ALUOP);
endmodule
