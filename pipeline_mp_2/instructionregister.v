`timescale 1ns / 1ns
module instreg(
    input [7:0] add,
    output [15:0] inst
);
    reg [15:0] mem[255:0];
    assign inst = mem[add];
    reg [15:0] nop1[2:0];
    reg [15:0] nop2[1:0];

    reg [2:0] r2wr;
    reg isreg;
    integer i;
    integer j;
    initial begin
    for (i = 0; i < 256; i = i + 1) begin
        if (mem[i][15:13] == 3'b000) begin
            r2wr = mem[i][8:6];
            isreg = 1;
        end else if (mem[i][15:13] == 3'b001 || mem[i][15:13] == 3'b010) begin
            r2wr = mem[i][2:0];
            isreg = 1;
        end else begin
            isreg = 0;
        end
        #2
        if (mem[i][15:13] == 3'b100) begin
            for (j = 255; j > i+2; j = j - 1) begin
                mem[j] = mem[j - 2];
            end
            mem[i + 1] = 16'b0000000000000000; // Insert NOP
            mem[i + 2] = 16'b0000000000000000; // Insert NOP
            i = i+3;
            end
        if (isreg == 1) begin
            if (mem[i+1][15:13] == 3'b000) begin
                if (mem[i+1][2:0] == r2wr || mem[i+1][5:3] == r2wr) begin
                    for (j = 255; j > i+3; j = j - 1) begin
                        mem[j] = mem[j - 3];
                    end
                    mem[i + 1] = 16'b0000000000000000; // Insert NOP
                    mem[i + 2] = 16'b0000000000000000; // Insert NOP
                    mem[i + 3] = 16'b0000000000000000; // Insert NOP
                    i = i+3;
                end
            end else if (mem[i+1][15:13] == 3'b001 || mem[i+1][15:13] == 3'b010) begin
                if (mem[i+1][5:3] == r2wr) begin
                    for (j = 255; j > i+3; j = j - 1) begin
                        mem[j] = mem[j - 3];
                    end
                    mem[i + 1] = 16'b0000000000000000; // Insert NOP
                    mem[i + 2] = 16'b0000000000000000; // Insert NOP
                    mem[i + 3] = 16'b0000000000000000; // Insert NOP
                    i = i+3;
                end
            end
        end
    end 
end  
endmodule
