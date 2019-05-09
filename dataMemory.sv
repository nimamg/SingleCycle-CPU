`timescale 1ns/1ns

module dataMemory(input[9:0] address, input[15:0] writeData, input memWriteEn, output[15:0] readData);
    reg [15:0] memory [0:999];
    initial begin
      memory[500] = 1;
      memory[501] = 2;
      memory[502] = 3;
      memory[503] = 4;
      memory[504] = 5;
      memory[505] = 6;
      memory[506] = 7;
      memory[507] = 8;
      memory[508] = 9;
      memory[509] = 10;
    end
    assign readData = memory[address];
    always @* begin
        if (memWriteEn)
          memory[address] = writeData;
    end
endmodule
