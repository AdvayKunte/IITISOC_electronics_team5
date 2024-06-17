`timescale 1ns / 1ps
//the reg file is created above regfile module

module Datapath(NIA,RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemToReg,OpFn,clk,rst);
    input NIA,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,clk,rst;
    input [2:0] RegDst,ALUFn;
    output [4:0] OpFn;
    
    wire [7:0] tDecode,tIR,Immj,A,B,MemReg,SignExtendedImm,FinalB;
    wire tALU;
    wire [15:0] tInst;
    wire [6:0] Immi;
    wire [2:0] Ra,Rb,Rd;
    reg [4:0] Opfn;
    reg  alubeq;
    reg [7:0] ToMux;
    reg [7:0] alu_out;
    programcounter PC(.im(tDecode),.clk(clk),.rst(rst),.branch(tALU),.nia(NIA),.add(tIR));
  
    instreg IR(.add(tIR),.inst(tInst));
  
    decoder DE(.inst(tInst),.ra_i(Ra),.rb_i(Rb),.rd_i(Rd),.immi(Immi),.immj(Immj),.opfn(Opfn));
  
    RegFile RF(.RA(Ra),.RB(Rb),.RD1(Rd),.RegWrite(RegWrite),.RegDst(RegDst),.A(A),.B(B),.clk(clk),.Mem_to_Reg(MemReg));
  
    SignExtender SE(.Imm7(Immi),.Imm8(SignExtendedImm));
  
    MUX M(.inB(B),.imm(SignExtendedImm),.sel(ALUSrc),.outB(FinalB));
  
    ALU AL(.Ra(A),.Rb(FinalB),.alufn(ALUFn),.alubeq(alubeq),.alu_out(alu_out));
  
    register256x8 MEM(.clk(clk),.mem_read(MemRead),.mem_write(MemWrite),.aluout_in(alu_out),.address_in(B),.memtoreg_out(ToMux));
  
    mux2x1 MU(.mem_in(ToMux),.alu_in(alu_out),.memtoreg_sel(MemToReg),.mux_out(MemReg));
endmodule
