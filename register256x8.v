`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 14:35:01
// Design Name: 
// Module Name: register256x8
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
///////////////////////////////////////////////////////////////////////////////

module register256x8 (
    input wire clk,            
    input wire mem_read,        
    input wire mem_write,       
    input wire [7:0] aluout_in,   // Input from ALU
    input wire [7:0] address_in,   // Address input from Register File
    output reg [7:0] memtoreg_out   // Output to Mux
);

    reg [7:0] memory_array [255:0];  // 256 registers of 8 bits 
    
    always @(posedge clk) 
    begin
        if (mem_write) 
        begin
            memory_array[address_in] <= aluout_in;
        end
    end

    always @(posedge clk) 
    begin
        if (mem_read) 
        begin
            memtoreg_out <= memory_array[address_in];
        end
    end
endmodule
