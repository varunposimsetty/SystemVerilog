//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module serial_adder
(
  input  clk,
  input  rst,
  input  a,
  input  b,
  output sum
);

  // Note:
  // carry_d represents the combinational data input to the carry register.

  logic carry;
  wire carry_d;

  assign { carry_d, sum } = a + b + carry;

  always_ff @ (posedge clk)
    if (rst)
      carry <= '0;
    else
      carry <= carry_d;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_adder_using_logic_operations_only
(
  input  clk,
  input  rst,
  input  a,
  input  b,
  output sum
);

  // Task:
  // Implement a serial adder using only ^ (XOR), | (OR), & (AND), ~ (NOT) bitwise operations.
  //
  // Notes:
  // See Harris & Harris book
  // or https://en.wikipedia.org/wiki/Adder_(electronics)#Full_adder webpage
  // for information about the 1-bit full adder implementation.
  //
  // See the testbench for the output format ($display task).
  logic var_sum;

  always_ff @(posedge clk)
    if (rst)
      var_sum <= 0;
    else 
      var_sum <= a + b;
    
  assign sum = var_sum;

endmodule