`timescale 1ns/1ns

module L4 (alu_in, mem_in, MemToRegmux, alu_out, mem_out, MemToReg, clk2);

input [7:0] alu_out, mem_out;
input MemToReg, clk2;

output [7:0] alu_in, mem_in;
output MemToRegmux;

reg [7:0] L4_alu_out, L4_mem_out;
reg L4_MemToReg;

assign alu_in = L4_alu_out;
assign mem_in = L4_mem_out;
assign MemToRegmux = L4_MemToReg;

    always @(*) begin
    L4_alu_out <= #2 alu_out;
    L4_mem_out <= #2 mem_out;
    L4_MemToReg <= MemToReg;
    
end
    
endmodule
