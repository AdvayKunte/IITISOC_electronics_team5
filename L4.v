`timescale 1ns/1ns

module L4 (alu_in, mem_in, MemToRegmux, alu_out, mem_out, MemToReg, clk2);

input [7:0] alu_out, mem_out;
input MemToReg, clk2;

output reg [7:0] alu_in, mem_in;
output reg MemToRegmux;

reg [7:0] L4_alu_out, L4_mem_out;
reg L4_MemToReg;

always @(*) begin
    L4_alu_out <= alu_out;
    L4_mem_out <= mem_out;
    L4_MemToReg <= MemToReg;
    
end

always @(posedge clk2) begin
    alu_in <= L4_alu_out;
    mem_in <= L4_mem_out;
    MemToRegmux <= L4_MemToReg;
end
    
endmodule
