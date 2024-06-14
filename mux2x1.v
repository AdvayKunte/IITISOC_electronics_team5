`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 07:29:31
// Design Name: 
// Module Name: mux2x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2x1(
    input wire [7:0] mem_in,
    input wire [7:0] alu_in,
    input wire memtoreg_sel,
    output wire [7:0] mux_out
    );
    assign mux_out = (memtoreg_sel) ? alu_in : mem_in;
endmodule
