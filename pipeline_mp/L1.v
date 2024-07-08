`timescale 1ns / 1ps


module L1(clk1, Ra, Rb, Rd, SignExtendedImm, m1, m2, RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemtoReg, Raout, Rbout, Rdout, immout, m1out, m2out, regdstout, regwriteout, alusrcout, alufnout, memwriteout, memreadout, memtoregout);
    input [2:0] Ra,Rb,Rd;
    input [7:0] SignExtendedImm,m1,m2;
    input clk1;
    input RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemtoReg;
    
    output reg [2:0] Raout, Rbout, Rdout;
    output reg [7:0] immout, m1out, m2out;
    output reg regdstout, regwriteout, alusrcout, alufnout, memwriteout, memreadout, memtoregout; 
    
    reg [2:0] L1_Ra, L1_Rb, L1_Rd;
    reg [7:0] L1_SignExtendedImm, L1_m1, L1_m2;
    reg L1_RegDst,L1_RegWrite,L1_ALUSrc,L1_ALUFn,L1_MemWrite,L1_MemRead,L1_MemtoReg; 
   
    always @(*)
    begin
        L1_Ra <= #2 Ra;
        L1_Rb <= #2 Rb;
        L1_Rd <= #2 Rd;
        L1_SignExtendedImm <= #2 SignExtendedImm;
        L1_m1 <= #2 m1;
        L1_m2 <= #2 m2;
        L1_RegDst <= #2 RegDst;
        L1_RegWrite <= #2 RegWrite;
        L1_ALUSrc <= #2 ALUSrc;
        L1_ALUFn <= #2 ALUFn;
        L1_MemWrite <= #2 MemWrite;
        L1_MemRead <= #2 MemRead;
        L1_MemtoReg <= #2 MemtoReg;
    end
    
    always @(posedge clk1)
    begin
        Raout <= #2 L1_Ra;
        Rbout <= #2 L1_Rb;
        Rdout <= #2 L1_Rd;
        immout <= #2 L1_SignExtendedImm;
        m1out <= #2 L1_m1;
        m2out <= #2 L1_m2;
        regdstout <= #2 L1_RegDst;
        regwriteout <= #2 L1_RegWrite;
        alusrcout <= #2 L1_ALUSrc;
        alufnout <= #2 L1_ALUFn;
        memwriteout <= #2 L1_MemWrite;
        memreadout <= #2 L1_MemRead;
        memtoregout <= #2 L1_MemtoReg;
    end
endmodule
