// Testbench for top_design
module tb_top_design;

    reg [2:0] x;     //  X1, X2, X3
    logic y;         
    logic clk;

  // Instantiate DUT (Device Under Test)
  top_design dut(.in(x), .y(y), .clk(clk));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin

    #15;
    x = 3'b000; #11;
    x = 3'b001; #13;
    x = 3'b010; #17;
    x = 3'b011; #14;
    x = 3'b100; #10;
    x = 3'b101; #19;
    x = 3'b110; #11;
    x = 3'b111; #16;
    x = 3'b000; #100;

    $finish;
  end
  initial begin
  
    $monitor("time=%0t | X1=%b X2=%b X3=%b | Y=%b CLK", $time, x[2], x[1], x[0], y, clk);

    
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_top_design);
  end
endmodule
