module instreg(add,inst);
    input [7:0] add;
    output [15:0] inst;
    reg [15:0] mem[255:0];
    assign inst = mem[add];
endmodule 
    
        