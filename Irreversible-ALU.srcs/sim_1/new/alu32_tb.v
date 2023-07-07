module alu32_tb;

  // Inputs
  reg [31:0] A, B;
  reg [7:0] CONTROL;

  // Outputs
  wire [31:0] OUT;

  // Instantiate the DUT
  alu32 uut(.A(A), .B(B), .CONTROL(CONTROL), .OUT(OUT));

  // Clock generation
  reg clk;
  always #5 clk = ~clk;

  // Testbench initialization
  initial begin
    clk = 0;

    // Test case 1: Single bit shift
    A = 16'hA5A5;
    B = 16'hFFFF;
    CONTROL = 8'b00000001;
    #10;
    $display("Single bit shift result: %h", OUT);

    // Test case 2: Boolean operation (OR)
    A = 16'hA5A5;
    B = 16'hFFFF;
    CONTROL = 8'b00000100;
    #10;
    $display("Boolean operation result: %h", OUT);

    // Test case 3: Arithmetic operation (Addition)
    A = 16'h1234;
    B = 16'h5678;
    CONTROL = 8'b00010000;
    #10;
    $display("Arithmetic operation result: %h", OUT);

    // Test case 4: Comparator operation (Greater than)
    A = 16'hAAAA;
    B = 16'h5555;
    CONTROL = 8'b00100011;
    #10;
    $display("Comparator operation result: %h", OUT);

    // Add more test cases as needed

    // End simulation
    $finish;
  end

  // Clock generation
  always #5 clk = ~clk;

endmodule
