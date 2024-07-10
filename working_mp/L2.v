`timescale 1ns / 1ps

module L2(clk2, L1_m1, L1_m2, L1_SignExtendedImm, L1_A, L1_B, L1_ALUSrc,L1_ALUFn,L1_MemWrite,L1_MemRead,L1_MemtoReg, ALUSrcout, ALUFnout, memwriteout, memreadout, memtoregout, immout, Aout, Bout, m1out, m2out);

    input [7:0] L1_SignExtendedImm, L1_A, L1_B, L1_m1, L1_m2;
    input clk2;
    input L1_ALUSrc,L1_ALUFn,L1_MemWrite,L1_MemRead,L1_MemtoReg;

    output reg [7:0] immout, Aout, Bout, m1out, m2out;
    output reg ALUSrcout, ALUFnout, memwriteout, memreadout, memtoregout;

    reg [7:0] L2_SignExtendedImm, L2_A, L2_B, L2_m1, L2_m2;
    reg L2_ALUSrc,L2_ALUFn,L2_MemWrite,L2_MemRead,L2_MemtoReg;

    always @(*)
    begin
        L2_SignExtendedImm <= #2 L1_SignExtendedImm;
        L2_A <= #2 L1_A;
        L2_B <= #2 L1_B;
        L2_m1 <= #2 L1_m1;
        L2_m2 <= #2 L1_m2;
        L2_ALUSrc <= #2 L1_ALUSrc;
        L2_ALUFn <= #2 L1_ALUFn;
        L2_MemWrite <= #2 L1_MemWrite;
        L2_MemRead <= #2 L1_MemRead;
        L2_MemtoReg <= #2 L1_MemtoReg;
    end
    
    always @(posedge clk2)
    begin
        immout <= #2 L2_SignExtendedImm;
        Aout <= #2 L2_A;
        Bout <= #2 L2_B;
        m1out <= #2 L2_m1;
        m2out <= #2 L2_m2;
        ALUSrcout <= #2 L2_ALUSrc;
        ALUFnout <= #2 L2_ALUFn;
        memwriteout <= #2 L2_MemWrite;
        memreadout <= #2 L2_MemRead;
        memtoregout <= #2 L2_MemtoReg;
    end
endmodule
