// Top design 
module top_design( input [2:0] in, output y, input clk);

    //wire nx1, nx2, nx3; // ~x1, ~x2, ~x3
    wire and1_out, and2_out; // and1: ~X1 & X2 & ~X3  and2: X1 & ~X2 & X3

    //NOT1 INV1(.a(in[2]), .y(nx1), .clk(clk));  // X1
    //NOT1 INV2(.a(in[1]), .y(nx2), .clk(clk));  // X2
    //NOT1 INV3(.a(in[0]), .y(nx3), .clk(clk));  // X3

    // and1: ~X1 & X2 & ~X3
    AND3 AND1( .a(~in[2]), .b(in[1]), .c(~in[0]), .y(and1_out), .clk(clk));

    // and2: X1 & ~X2 & X3
    AND3 AND2(.a(in[2]), .b(~in[1]), .c(in[0]), .y(and2_out), .clk(clk));

    // y = and1_out | and2_out
    OR2 OR1(.a(and1_out), .b(and2_out), .y(y), .clk(clk));

endmodule

// NOT gate
module NOT1(input a, output reg y, input clk);
    always @(posedge clk) begin
        y = ~a;
    end 
endmodule

// AND gate with 3 inputs
module AND3(input a, input b, input c, output reg y, input clk);
    always @(posedge clk) begin
            y <= a & b & c ;
        end
endmodule

// OR gate with 2 inputs
module OR2(input a, input b, output reg y, input clk);
    always @(posedge clk) begin
            y <= a | b; 
        end
endmodule


