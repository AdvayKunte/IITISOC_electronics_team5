`timescale 1ns / 1ps
`include "Datapath_updated.v"
`include "controlpath.v"

module clkgen(clk);
    output reg clk;
    initial clk = 0;
    always #4 clk = ~clk;
endmodule

module testbench();
    reg clk, rst;
    wire [4:0] OpFn;
    wire NIA, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,RegDst;
    wire [2:0]ALUFn;

    // Instantiate the Datapath module
    Datapath d(
        .NIA(NIA), 
        .RegDst(RegDst), 
        .RegWrite(RegWrite), 
        .ALUSrc(ALUSrc), 
        .ALUFn(ALUFn), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .MemToReg(MemToReg), 
        .OpFn(OpFn), 
        .clk(clk), 
        .rst(rst)
    );
    
    // Instantiate the controlpath module
    controlpath cp(
        .OpFn(OpFn), 
        .NIA(NIA), 
        .RegDst(RegDst), 
        .RegWrite(RegWrite), 
        .ALUSrc(ALUSrc), 
        .ALUFn(ALUFn), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .MemToReg(MemToReg)
    );
endmodule
