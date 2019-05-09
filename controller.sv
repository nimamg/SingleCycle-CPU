`timescale 1ns / 1ns

module ctrlr (input clk, zero, input [7:0] func,  input [3:0] opcode,output reg [1:0] pcsel, alusel, output reg datasel, regWriteEn, memWriteEn, changewnd, output reg [2:0] aluop);
  always @ (opcode, func) begin
    $display("opcode is %b", opcode);
    memWriteEn = 0;
    regWriteEn = 0;
    pcsel = 0;
    datasel = 0;
    changewnd = 0;
    case (opcode)
      4'b0000: begin //lw
        datasel = 1;
        regWriteEn = 1;
      end
      4'b0001: begin //sw
        memWriteEn = 1;
      end
      4'b0010: begin // jump
        pcsel = 2;
      end
      4'b0100: begin // branchz
        if (zero) begin
        pcsel = 1;
        end
        else begin
          pcsel = 0;
        end
        alusel = 0;
        aluop = 4;
      end
      4'b1100: begin //addi
        regWriteEn = 1;
        alusel = 2;
        aluop = 3;
      end
      4'b1101: begin //subi
        regWriteEn = 1;
        alusel = 2;
        aluop = 5;
      end
      4'b1110: begin //andi
        alusel = 2;
        aluop = 0;
        regWriteEn = 1;
      end
      4'b1111: begin // ori
        aluop = 1;
        regWriteEn = 1;
        alusel = 2;
      end
      4'b1000: begin //rtype
        $display("rtype, %b, %b", opcode, func);
        if (func[7] == 0) begin //calc
          regWriteEn = 1;
          alusel = 0;
          if (func == 1) begin // move
            alusel = 1;
            aluop = 3;
          end
          else if (func == 2) begin // add
            aluop = 3;
          end
          else if (func == 4) begin //sub
            aluop = 4;
          end
          else if (func == 8) begin //and
            aluop = 0;
          end
          else if (func == 16) begin // or
            aluop = 1;
          end
          else if (func == 32) begin // not
            aluop = 2;
          end
          else if (func == 64) begin //nop
            regWriteEn = 0;
          end
        end
        else begin // window
          $display("wnd");
          changewnd = 1;
        end
      end
    endcase
  end
endmodule
