IITISOC MICROPROCESSOR DESIGN PROJECT
<img width="731" alt="MP arch" src="https://github.com/user-attachments/assets/659e4208-77f9-4a7c-9708-eb4b60867e60">
The repository contains the verilog files of the individual components of the microprocessor along with the datapath file , where all of them are integrated.
We have created a mp_tb.v , testbench to test the working of the microprocessor designed by loading in data into Memory and instructions in the Instruction Memory as done by us in the mp_tb.v file
Hence upon downloading all the files and running the mp_tb.v file , will lead to simulation of working of the microprocessor 
![Screenshot 2024-07-22 164720](https://github.com/user-attachments/assets/5580c3aa-68bd-4094-9568-f6fda30cda21)
![Screenshot 2024-07-22 164612](https://github.com/user-attachments/assets/d7394452-682f-4198-9ac6-124fb57f8e95)
You may refer to this chart to try and run instructions based on the given format of coding
For R type instruction 
    Pls enter OpCode depending upon type of instruction , the ALU fn as necessary and then leave the next two bits 00 and then the remaining 9 bits to be register          addresses of the Write , read1 and read2 registers
For I type instruction 
    Pls enter the OpCode depending upon type of instruction , the immediate value , 
    For example the addi : The immediate value will be the second adding value in 7 bits as would like to be passed
    For the load word store word instruction -:
    Write the immediate and choose register at address 000 or the one at adress 111 ( one is default 0 value and another default 127 value)
    And then the address at the memory location would be immediate ( 8bit extended positive from 1 to 128) and the register value hence going from 0 to 255
  For J type instruction 
   Write the Opcode and 8 bit immediate and leave others unused.
You may refer to the sample instructions already loaded in the instruction register


