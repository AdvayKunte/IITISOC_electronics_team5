module adder(in1,in2,out);
    input [7:0] in1,in2;
    output [7:0] out;
    assign out = in1 + in2;
endmodule