module alu ( Ra, Rb, alufn, alubeq, alu_out);
    input  [7:0] Ra;
    input  [7:0] Rb;
    input  [2:0] alufn;
    input  alubeq;
    output reg [7:0] alu_out;
    
always @(*) begin
    case (alufn)
        3'b000: 
          alu_out <= Ra + Rb; 
        3'b001:
          alu_out <= Ra - Rb;
        3'b010:
            alu_out <= Ra & Rb ;   
        3'b011:
            alu_out <= Ra | Rb;
      
        3'b100: ;
        3'b101: ;
        3'b110: ;
        3'b111: 
           alu_out= alubeq;
        
        default: ;
    endcase
    
end
    
endmodule

