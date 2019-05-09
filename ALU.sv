`timescale 1ns/1ns

module ALU(input[15:0] A, B, input[2:0] ALUOP, output[15:0] out, output zero);
    assign out = (ALUOP == 0) ? (A & B) :
                 (ALUOP == 1) ? (A | B) :
                 (ALUOP == 2) ? (~B) :
                 (ALUOP == 3) ? (A + B) :
                 (ALUOP == 4) ? (A - B) :
                 (ALUOP == 5) ? (B - A) :
                 out;
    assign zero = (out == 0) ? 1 : 0;
endmodule
