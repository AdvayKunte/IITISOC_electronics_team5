`timescale 1ns / 1ns
`include "dpnew.v"


module clkgen(clk);
    output reg clk;
    initial clk = 0;
    always #0.5 clk = ~clk;
endmodule

module testbench();
    reg rst;
    wire clk;
    wire [4:0] OpFn;
    wire NIA, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,RegDst;
    wire [2:0]ALUFn;
    clkgen c1(clk);
    // Instantiate the Datapath module
    Datapath d(
        .clk(clk), 
        .rst(rst)
    );
    
    // Instantiate the controlpath module
    integer i ;
    always @ (posedge clk)
        begin
            $display("Time: %0d , add = %b , inst=%b , m1 = %b , m2= %b , alubeq= %b , pin =%b ",$time, d.tIR, d.tInst, d.l2m2out , d.l2m1out, d.alubeq , d.pin);
            $display("Time: %0d , OpFn=%b , Branch = %b, NIA=%b , RegA=%b , RegB=%b , RegC=%b, RegD=%b, Mem[250]=%b ,Mem[0]=%b",$time,d.OpFn,d.alubeq, d.NIA,d.RF.RegFile[1],d.RF.RegFile[2],d.RF.RegFile[3], d.RF.RegFile[4], d.MEM.memory_array[250],d.MEM.memory_array[0]);
        end 
    initial 
        begin
            /* d.IR.mem[0]= 16'b0010001010000001;  // Set A to 10 -> (addi Reg A with Reg0)
            d.IR.mem[1]= 16'b0010001111000010;  //Set B to 15 -> (addi RegB with Reg0)
            d.IR.mem[2]= 16'b0000000011001010;  //C = A+B   -> (add A and B)
            d.IR.mem[3]= 16'b0111111011111001;  // Store the number (A) to the memory adress (250)
            d.IR.mem[4]= 16'b0100000000000100; //Set D to 0 -> Load from mem0
            d.IR.mem[5]= 16'b1000000001000010; //Check if B is equal to zero -> (beq)
            d.IR.mem[6]= 16'b0010000000000011; //Set C to zero
            d.IR.mem[7]= 16'b1010000000000000; // Jump to 0 again  */

            d.IR.mem[0]= 16'b0010001101000001;  // set A=13
            d.IR.mem[1]= 16'b0010010001000010;  // set b=17
            d.IR.mem[2]= 16'b0000000011001010;  //Set C to A+B -> (addi RegB with Reg0)
            d.IR.mem[3]= 16'b0010000001000100;  //Set D to 1-> (addi RegB with Reg0)
            d.IR.mem[4]= 16'b0000000101100001;  //Set E=A+D -> (addi RegB with Reg0)

/*             d.IR.mem[0]= 16'b0010001010000001;  // Set A to 10
            d.IR.mem[1]= 16'b0010000101000010;  //Set B to 5 -> (addi RegB with Reg0)
            d.IR.mem[2]= 16'b0010000101000011;  //Set C to 5-> (addi RegB with Reg0)
            d.IR.mem[3]= 16'b0000000100011010;  //C = C-A   -> (add A and B and set as D)
            d.IR.mem[4]= 16'b0000100010001100;  //B = A-D -> (subtract A and D and set as B)
            d.IR.mem[5]= 16'b0110000000000011; //Store Mem[0] with C (store function)
            d.IR.mem[6]= 16'b0100000001000001; //Load A with Mem[1]  (load function)
            d.IR.mem[7]= 16'b1000000000000010; //Check whether B is zero  (branch equal function)
            d.IR.mem[8]= 16'b0010000000000011; //Set C to zero      (add RegC with Reg0)
            d.IR.mem[9]= 16'b1010000000000000; // Jump to 0 again   (Jump function) */ 


            for(i=0;i<256;i=i+1)
                begin
                d.MEM.memory_array[i] = i;
                end 
            $dumpfile("mp.vvp");
            $dumpvars(0,testbench);
            rst = 1;
            #12
            rst =0;
            #100
            $finish;
        end
endmodule
