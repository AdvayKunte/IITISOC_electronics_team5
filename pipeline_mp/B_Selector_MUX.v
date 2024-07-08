 module MUX(inB,imm,sel,outB);
    output [7:0] outB;
    input [7:0] inB,imm;
    input sel;
    assign out=sel?imm:inB;
 endmodule
