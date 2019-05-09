`timescale 1ns/1ns

module pc(input[9:0] in, input clk, rst, output reg[9:0] out);
    always @(posedge clk, posedge rst) begin
        if (rst)
            out <= 9'b0;
        else
            out <= in;
    end
endmodule