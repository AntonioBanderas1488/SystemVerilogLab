module top_design(input [2:0] in, output y);

    wire and1_out, and2_out; // and1: ~X1 & X2 & ~X3  and2: X1 & ~X2 & X3
    // and1: ~X1 & X2 & ~X3
    AND3 AND1( .a(~in[2]), .b(in[1]), .c(~in[0]), .y(and1_out));
    // and2: X1 & ~X2 & X3
    AND3 AND2(.a(in[2]), .b(~in[1]), .c(in[0]), .y(and2_out));
    // y = and1_out | and2_out
    OR2 OR1(.a(and1_out), .b(and2_out), .y(y));

endmodule

// NOT gate
module NOT1(input a, output y);
        assign y = ~a;
endmodule

// AND gate with 3 inputs
module AND3(input a, input b, input c, output y);
        assign y = a & b & c;
endmodule

// OR gate with 2 inputs
module OR2(input a, input b, output y);
        assign y = a | b; 
endmodule