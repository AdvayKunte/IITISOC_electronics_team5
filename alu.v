module alu ( Ra, Rb, alufn, alubeq, alu_out);
    input  [7:0] Ra;
    input  [7:0] Rb;
    input  [2:0] alufn;
    output reg  alubeq;
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
        3'b100: 
            alu_out <= Ra + Rb;  //addi It will be addition
        3'b101: 
            alu_out <= Ra + Rb;  //lw It will be addition (Address Calculation)
        3'b110: 
            alu_out <= Ra + Rb;  //sw It will be addition (Address Calculation)
        3'b111: begin
           if (Ra==Rb) begin
            alubeq <= 1;
           end
           else begin
            alubeq <= 0;
           end
            
        end
        default: ;
    endcase
    
end
    
endmodule


