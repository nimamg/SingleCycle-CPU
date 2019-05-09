`timescale 1ns/1ns

module instructionMemory(input[9:0] in, output [15:0] instruction);
    reg [15:0] memory [0:999];
    assign instruction = memory[in];
    initial begin
      memory[0] = 16'b1000000010000000; // wnd0
      memory[1] = 16'b1110000000000000; // andi R0 , R0, 0
      memory[2] = 16'b0000010111110100; // lw R1 , 500
      memory[3] = 16'b1000000100000010; // add R0, R1
      memory[4] = 16'b1000000001000000; // nop :))
      memory[5] = 16'b0000010111110101; // lw R1 , 501
      memory[6] = 16'b1000000100000010; // add R0, R1
      memory[7] = 16'b0000010111110110; // lw R1 , 502
      memory[8] = 16'b1000000100000010; // add R0, R1
      memory[9] = 16'b0000010111110111; // lw R1 , 503
      memory[10] = 16'b1000000100000010; // add R0, R1
      memory[11] = 16'b0000010111111000; // lw R1 , 504
      memory[12] = 16'b1000000100000010; // add R0, R1
      memory[13] = 16'b0000010111111001; // lw R1 , 505
      memory[14] = 16'b1000000100000010; // add R0, R1
      memory[15] = 16'b0000010111111010; // lw R1 , 506
      memory[16] = 16'b1000000100000010; // add R0, R1
      memory[17] = 16'b0000010111111011; // lw R1 , 507
      memory[18] = 16'b1000000100000010; // add R0, R1
      memory[19] = 16'b0000010111111100; // lw R1 , 508
      memory[20] = 16'b1000000100000010; // add R0, R1
      memory[21] = 16'b0000010111111101; // lw R1 , 509
      memory[22] = 16'b1000000100000010; // add R0, R1

    end
endmodule
