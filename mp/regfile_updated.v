`timescale 1ns / 1ns


module RegFile(RA,RB,RDo,RegWrite,A,B,clk,Mem_to_Reg);
    input [2:0] RA,RB,RDo;
    input RegWrite, clk;
    output reg [7:0] A,B;
    reg [7:0] RegFile [7:0];
    input [7:0] Mem_to_Reg;
    
    always@(posedge clk)
        begin
            if(RA==3'b000)
                 A<= #2 0;
            else 
                A<= #2 RegFile[RA];
            if (RB==3'b000)
                B<= #2 0;
            else
                B<= #2 RegFile[RB];
            
            if(RegWrite)
                RegFile[RDo] <= #2 Mem_to_Reg;

                
        end
    
endmodule
