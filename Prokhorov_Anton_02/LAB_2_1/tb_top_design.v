module tb_top_design;

    reg [2:0] x;  //  X1, X2, X3
    logic y;          
  // Instantiate DUT (Device Under Test)
  top_design dut(.in(x), .y(y));

  initial begin

    x = 3'b000; #10;
    x = 3'b001; #10;
    x = 3'b010; #10;
    x = 3'b011; #10;
    x = 3'b100; #10;
    x = 3'b101; #10;
    x = 3'b110; #10;
    x = 3'b111; #10;
    $finish;

  end

  initial begin
    $monitor("time=%0t | X1=%b X2=%b X3=%b | Y=%b CLK", $time, x[2], x[1], x[0], y);
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_top_design);
  end

endmodule
