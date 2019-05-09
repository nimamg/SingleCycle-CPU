`timescale 1ns / 1ns

module tb();
  reg clk = 1 , rst;
  MIPS cpu (clk, rst);
  always #100 clk = ~clk;
  initial begin
    rst = 1;
    #1000;
    rst = 0;
    #10000;
    $stop;
  end
endmodule
