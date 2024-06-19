`timescale 1ns / 1ns
`include "Datapath_updated.v"
`include "controlpath.v"

module clkgen(clk);
    output reg clk;
    initial clk = 0;
    always #4 clk = ~clk;
endmodule

module testbench();
    reg rst;
    wire clk;
    wire [4:0] OpFn;
    wire NIA, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,RegDst;
    wire [2:0]ALUFn;
    clkgen c1(clk);
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
    
    always @ (posedge clk)
        begin
            $display("Time: %0d , OpFn=%b , NIA = %b , ALUFn= %b , branch= %b",$time,OpFn,NIA,ALUFn,d.alubeq);
        end 
    initial 
        begin
            $monitor("Time: %0d , OpFn=%b , NIA = %b , ALUFn= %b ",$time,OpFn,NIA,ALUFn);
            d.IR.mem[0]= 16'b0001100010011001; 
            d.IR.mem[1]= 16'b0001000100011010; 
            d.IR.mem[2]= 16'b0010100100011011; 
            d.IR.mem[3]= 16'b0110100100011110;        
            $dumpfile("mp.vvp");
            $dumpvars(0,testbench);
            rst = 1;
            #10
            rst =0;
            #70
            $finish;
        end
endmodule
