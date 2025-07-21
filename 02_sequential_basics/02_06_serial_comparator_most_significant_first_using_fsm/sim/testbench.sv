module testbench;

  logic clk, rst, a, b;
  logic a_less_b, a_eq_b, a_greater_b;

  serial_comparator_most_significant_first dut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .a_less_b(a_less_b),
    .a_eq_b(a_eq_b),
    .a_greater_b(a_greater_b)
  );

  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units clock period
  end

  initial begin
    $dumpfile("./work/dump.vcd");
    $dumpvars(0, testbench);

    rst = 1; #10; rst = 0;

    // Test Case 1: a = 1101, b = 1011 (a > b)
    #10 a = 1; b = 1; // MSB
    #10 a = 1; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 1;

    // Test Case 2: a = 0110, b = 0110 (a == b)
    #10 rst = 1; #10; rst = 0;
    #10 a = 0; b = 0; // MSB
    #10 a = 1; b = 1;
    #10 a = 1; b = 1;
    #10 a = 0; b = 0;

    // Test Case 3: a = 1001, b = 1110 (a < b)
    #10 rst = 1; #10; rst = 0;
    #10 a = 1; b = 1; // MSB
    #10 a = 0; b = 1;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;

    #50 $finish;
  end

endmodule