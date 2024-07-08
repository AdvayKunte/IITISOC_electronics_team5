`timescale 1ns / 1ps

module L3(clk1, L2_B, L2_alu_out, L2_MemWrite, L2_MemRead, L2_MemtoReg, Bout, alu_outout, memwriteout, memreadout, memtoregout);
    input [7:0] L2_B, L2_alu_out;
    input clk1;
    input L2_MemWrite,L2_MemRead,L2_MemtoReg;
    
    output reg [7:0] Bout, alu_outout;
    output reg memwriteout, memreadout, memtoregout;
    
    reg [7:0] L3_B, L3_alu_out;
    reg L3_MemWrite,L3_MemRead,L3_MemtoReg;
    
       always @(*)
    begin
        L3_B <= #2 L2_B;
        L3_alu_out <= #2 L2_alu_out;
        L3_MemWrite <= #2 L2_MemWrite;
        L3_MemRead <= #2 L2_MemRead;
        L3_MemtoReg <= #2 L2_MemtoReg;
    end
    
    always @(posedge clk1)
    begin
        Bout <= #2 L3_B;
        alu_outout <= #2 L3_alu_out;
        memwriteout <= #2 L3_MemWrite;
        memreadout <= #2 L3_MemRead;
        memtoregout <= #2 L3_MemtoReg;
    end
    
endmodule
