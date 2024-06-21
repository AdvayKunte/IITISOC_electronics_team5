module alu ( Ra, Rb, alufn, alubeq, alu_out);
    input  [7:0] Ra;
    input  [7:0] Rb;
    input  [2:0] alufn;
    output reg  alubeq;
    output reg [7:0] alu_out;
    
always @(*) begin
    case (alufn)
        3'b000: begin
          alu_out <= Ra + Rb; alubeq <= 0;
          end
        3'b001: begin
          alu_out <= Ra - Rb; alubeq <= 0;
          end
        3'b010: begin
            alu_out <= Ra & Rb ; alubeq <= 0;
            end
        3'b011: begin
            alu_out <= Ra | Rb;alubeq <= 0;
            end
        3'b100: begin
            alu_out <= Ra + Rb; alubeq <= 0; //addi It will be addition
            end
        3'b101: begin
            alu_out <= Ra + Rb; alubeq <= 0; //lw It will be addition (Address Calculation)
            end
        3'b110: begin
            alu_out <= Ra + Rb; alubeq <= 0; //sw It will be addition (Address Calculation)
            end
        3'b111: begin
           if (Ra==Rb) begin
            alubeq <= 0;
           end
           else begin
            alubeq <= 1;
           end
            
        end
        default: ;
    endcase
    
end
    
endmodule


