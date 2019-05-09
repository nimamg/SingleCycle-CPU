`timescale 1ns/1ns

module dataPath(input [2:0] ALUOP, input[1:0] PCSel, ALUSel, input dataSel, regWriteEn, memWriteEn, changeWnd, clk, rst, output[3:0] opcode, output[7:0] func, output zero);
    wire[9:0] PCin, PCout;
    wire[15:0] instruction, A, B, ALUOut, dataMemoryOut, Ain;
    wire[15:0] regWriteData;
    assign PCin = (PCSel == 0) ? PCout + 1 :
                  (PCSel == 1) ? {PCout[9:8], instruction[7:0]} :
                  (PCSel == 2) ? instruction[9:0] :
                  PCin;
    pc mod1(PCin, clk, rst, PCout);

    instructionMemory mod2(PCout, instruction);

    assign regWriteData = (dataSel == 0) ? ALUOut : dataMemoryOut;
    registerFile mod3(instruction[11:10], instruction[9:8], instruction[11:10], instruction[1:0], regWriteData, regWriteEn, changeWnd, clk, rst, A, B);

    assign Ain = (ALUSel == 0) ? A :
                 (ALUSel == 1) ? 0 :
                 (ALUSel == 2) ? {8'b0, instruction[7:0]} :
                 Ain;
    ALU mod4(Ain, B, ALUOP, ALUOut, zero);

    dataMemory mod5(instruction[9:0], A, memWriteEn, dataMemoryOut);

    assign opcode = instruction[15:12];
    assign func = instruction[7:0];
endmodule
