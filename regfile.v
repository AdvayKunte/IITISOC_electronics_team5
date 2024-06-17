`timescale 1ns / 1ps

 reg [7:0] RegFile [7:0];

module RegFile(RA,RB,RD1,RegWrite,RegDst,A,B,clk,Mem_to_Reg);
    input [2:0] RA,RB,RD1,RegDst;
    input RegWrite, clk;
    output reg [7:0] A,B;
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
                case(RegDst)
                    RD1: RegFile[RD1] <= #2 Mem_to_Reg;
                    RB: RegFile[RB] <= #2 Mem_to_Reg;
                    default: RegFile[RegDst]<= #2 8'bxxxx;
                endcase
        end
    
endmodule
