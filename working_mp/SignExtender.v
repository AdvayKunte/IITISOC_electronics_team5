`timescale 1ns / 1ps

module SignExtender(Imm7,Imm8);
    input [6:0] Imm7;
    output [7:0] Imm8;
    assign Imm8=  {1'b0,Imm7[6:0]};
    
 endmodule
