`timescale 1ns / 1ns
`include "programcounter.v"
`include "instructionregister.v"
`include "decoder.v"
`include "regfile_mux.v"
`include "regfile_updated.v"
`include "SignExtender.v"
`include "B_Selector_MUX.v"
`include "alu.v"
`include "register256x8.v"
`include "mux2x1.v"
`include "adder.v"
`include "regpc.v"
//the reg file is created above regfile module

module Datapath(NIA,RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemToReg,OpFn,clk,rst);
    input NIA,RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,clk,rst;
    input [2:0] ALUFn;
    output [4:0] OpFn;
    
    wire [7:0] tDecode,tIR,Immj,A,B,MemReg,SignExtendedImm,FinalB;
    wire [15:0] tInst;
    wire [6:0] Immi;
    wire [2:0] Ra,Rb,Rd, RDo;
    wire  alubeq;
    wire [7:0] ToMux;
    wire [7:0] alu_out;
    wire compbeq;
    wire [2:0] inst_br;
    wire [7:0] br_in;

    wire [7:0] pinc,pinci,pincj,pin;
    adder a1(.in1(tIR),.in2(8'b00000001),.out(pinc));
    adder a2(.in1(SignExtendedImm),.in2(pinc),.out(pinci));
    mux2x1 mp1(.mem_in(pinc),.alu_in(pinci),.memtoreg_sel(alubeq),.mux_out(pincj));
    mux2x1 mp2(.mem_in(Immj),.alu_in(pincj),.memtoreg_sel(NIA),.mux_out(pin));
    pc pc1(pin,clk,rst,tIR); 
    //programcounter PC(.imj(Immj),.imi(SignExtendedImm),.clk(clk),.rst(rst),.branch(alubeq),.nia(NIA),.add(tIR));
  
    instreg IR(.add(tIR),.inst(tInst));
  
    decoder DE(.inst(tInst),.ra_i(Ra),.rb_i(Rb),.rd_i(Rd),.immi(Immi),.immj(Immj),.opfn(OpFn));

    regfile_mux Rmux(.RB(Rb), .RDi(Rd), .RegDst(RegDst), .RDo(RDo));
  
    RegFile RF(.RA(Ra),.RB(Rb),.RDo(RDo),.RegWrite(RegWrite),.A(A),.B(B),.clk(clk),.Mem_to_Reg(MemReg));
  
    SignExtender SE(.Imm7(Immi),.Imm8(SignExtendedImm));
  
    mux2x1 MI(.mem_in(B),.alu_in(SignExtendedImm),.memtoreg_sel(ALUSrc),.mux_out(FinalB));

    alu AL(.Ra(A),.Rb(FinalB),.alufn(ALUFn),.alubeq(alubeq),.alu_out(alu_out));
  
    register256x8 MEM(.clk(clk),.mem_read(MemRead),.mem_write(MemWrite),.aluout_in(B),.address_in(alu_out),.memtoreg_out(ToMux));
  
    mux2x1 MU(.mem_in(ToMux),.alu_in(alu_out),.memtoreg_sel(MemToReg),.mux_out(MemReg));
endmodule
