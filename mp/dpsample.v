`timescale 1ns/1ns
`include "decoder.v"
`include "instructionregister.v"
`include "programcounter.v"

module clkgen(clk);
    output reg clk;
    initial 
        clk =0;
    always   
        begin  
        # 3
        clk = ~clk;
        end
endmodule

module dp;
    wire[2:0] ra_i , rb_i , rd_i;
    wire[6:0] immj;
    wire[4:0] opfn;
    reg rst;
    wire clk;
    clkgen clki(clk);
    wire [7:0] imm,add;
    wire[15:0] inst;
    reg branch,nia;
    programcounter pc1(imm,clk,rst,branch,nia,add);
    instreg ir1(add,inst);
    decoder d1(inst,ra_i,rb_i, rd_i,immj,imm,opfn);
    always @ (posedge clk)
        begin
            $display("Time: %0d , is: %b , ra_i:%b , rb_i=%b , rd=%b, immi=%b, imm=%b, opfn = %b ",$time,inst,ra_i,rb_i,rd_i,immj,imm,opfn);
        end 
    initial 
        begin
            ir1.mem[0]= 16'b0000100010011001; 
            ir1.mem[1]= 16'b0000100100011010; 
            ir1.mem[2]= 16'b0000100100011011; 
            ir1.mem[3]= 16'b0000100100011110;        
            $dumpfile("dp.vvp");
            $dumpvars(0,dp);
            $display("Time: %0d , %b , %b , %b , %b ",$time,ir1.mem[0],ir1.mem[1],ir1.mem[2],ir1.mem[3]);
            rst = 1;
            #4
            rst =0; branch= 1; nia =0;
            #10
            branch = 0; nia = 0;
            #40
            $finish;
        end
endmodule
    
