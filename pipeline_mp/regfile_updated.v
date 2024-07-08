/* `timescale 1ns / 1ns


module RegFile(RA,RB,RDo,RegWrite,A,B,clk,Mem_to_Reg);
    input [2:0] RA,RB,RDo;
    input RegWrite, clk;
    output reg [7:0] A,B;
    reg [7:0] RegFile [7:0];
    input [7:0] Mem_to_Reg;
    
    always@(RA or RB or RDo)
        begin
            if(RA==3'b000)
                 A<= #2 8'b00000000;
            else if(RA==3'b111)
                 A<= #2 8'b01111111;
            else 
                A<= #2 RegFile[RA];
            if (RB==3'b000)
                B<= #2 0;
            else if(RB==3'b111)
                B <= #2 8'b01111111;
            else
                B<= #2 RegFile[RB];
            
            if(RegWrite)
                RegFile[RDo] <= #2 Mem_to_Reg;

                
        end
    
endmodule
 */
 `timescale 1ns / 1ns

module RegFile(RA, RB, RDo, RegWrite, A, B, clk, Mem_to_Reg);
    input [2:0] RA, RB, RDo;
    input RegWrite, clk;
    output reg [7:0] A, B;
    reg [7:0] RegFile [7:0];
    input [7:0] Mem_to_Reg;
    
    always @(posedge clk) begin
        // Writing to the register file on positive edge of the clock
        if (RegWrite)
            RegFile[RDo] <= #2 Mem_to_Reg;
    end

    always @(*) begin
        // Reading register A
        if (RA == 3'b000)
            A = 8'b00000000;
        else if (RA == 3'b111)
            A = 8'b01111111;
        else
            A = RegFile[RA];
        
        // Reading register B
        if (RB == 3'b000)
            B = 8'b00000000;
        else if (RB == 3'b111)
            B = 8'b01111111;
        else
            B = RegFile[RB];
    end
endmodule
