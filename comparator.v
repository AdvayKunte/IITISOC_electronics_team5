`timescale 1ns/1ns

module comparator (inst_ir, branch_pcin);
    input [15:0] inst_ir;
    output reg branch_pcin;

always @(*) begin
    if(int_ir==100xxxx0111000x1)begin
        branch_pcin <= 1;
      end
    else begin
        branch_pcin <= 0;
    end
    
end


endmodule