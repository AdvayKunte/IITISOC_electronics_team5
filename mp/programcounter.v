module programcounter(im,clk,rst,branch,nia,add);
    input [7:0] im;
    input branch,nia,clk,rst;
    wire [7:0] pc;
    output reg [7:0]add;
    assign pc = add;
    always @ (posedge clk or posedge rst)
        begin
        if(rst)
            add <= 8'h0;
        else
            begin
            case(nia)
                1:  begin
                    if(branch==1)
                        add <= pc + im;
                    else
                        add <= pc+1;
                    end
                0:  begin
                        add <= im;
                    end
            endcase
            $display("Time: %0d , add = %b ",$time,add);
            end
        end
endmodule