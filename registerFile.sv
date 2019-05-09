`timescale 1ns/1ns

module registerFile(input[1:0] readReg1, readReg2, writeAddress, inWnd, input[15:0] writeData, input regWriteEn, changeWnd, clk, rst, output reg[15:0] regData1, regData2);
    reg [15:0] registers [0:7];
    reg address;
    reg[1:0] wnd;
    reg[2:0] address1, address2, address3;
    always @ (posedge rst) begin
      if (rst) begin
        integer i;
        for (i = 0 ; i < 16 ; i++) begin
          registers[i] = 0;
        end
      end
    end
    always @ (posedge changeWnd) begin
      wnd = inWnd;
    end
    assign address1 = ((wnd * 2 + readReg1) > 7) ? (wnd * 2 + readReg1 - 8) : (wnd * 2 + readReg1);
    assign address2 = ((wnd * 2 + readReg2) > 7) ? (wnd * 2 + readReg2 - 8) : (wnd * 2 + readReg2);
    assign address3 = ((wnd * 2 + writeAddress) > 7) ? (wnd * 2 + writeAddress - 8) : (wnd * 2 + writeAddress);
    assign regData1 = registers[address1];
    assign regData2 = registers[address2];
    always @(negedge clk) begin
        if (regWriteEn)
            registers[address3] <= writeData;
    end
endmodule
