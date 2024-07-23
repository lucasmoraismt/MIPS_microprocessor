module Testbench;
  reg clk;
  reg we3;
  reg [4:0] ra1, ra2, wa3;
  reg [31:0] wd3;
  wire [31:0] rd1, rd2;
  
  regfile uut (
    .clk(clk),
    .we3(we3),
    .ra1(ra1),
    .ra2(ra2),
    .wa3(wa3),
    .wd3(wd3),
    .rd1(rd1),
    .rd2(rd2)
  );
  
  initial begin
    // Initialize signals
    clk = 0;
    we3 = 0;
    ra1 = 0;
    ra2 = 0;
    wa3 = 0;
    wd3 = 0;

    // Write to register 1
    #5 we3 = 1; wa3 = 5'b00001; wd3 = 32'hA5A5A5A5;
    #5 clk = 1;
    #5 clk = 0;

    // Write to register 2
    #5 we3 = 1; wa3 = 5'b00010; wd3 = 32'h5A5A5A5A;
    #5 clk = 1;
    #5 clk = 0;

    // Read from registers 1 and 2
    #5 we3 = 0; ra1 = 5'b00001; ra2 = 5'b00010;
    #5 $display("rd1: %h, rd2: %h", rd1, rd2);

    // Read from register 0 (should be 0)
    #5 ra1 = 5'b00000;
    #5 $display("rd1: %h", rd1);

    // End simulation
    #10 $finish;
  end

  always #2.5 clk = ~clk; // Generate clock signal
endmodule
