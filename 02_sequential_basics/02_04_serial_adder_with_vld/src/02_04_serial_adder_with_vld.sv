//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_adder_with_vld
(
  input  clk,
  input  rst,
  input  vld,
  input  a,
  input  b,
  input  last,
  output logic[7:0] sum
);

  // Task:
  // Implement a module that performs serial addition of two numbers
  // (one pair of bits is summed per clock cycle).
  //
  // It should have input signals a and b, and output signal sum.
  // Additionally, the module have two control signals, vld and last.
  //
  // The vld signal indicates when the input values are valid.
  // The last signal indicates when the last digits of the input numbers has been received.
  //
  // When vld is high, the module should add the values of a and b and produce the sum.
  // When last is high, the module should output the sum and reset its internal state, but
  // only if vld is also high, otherwise last should be ignored.
  //
  // When rst is high, the module should reset its internal state.
  int ind_sum,temp_sum, final_sum = 0;

  always_ff @(posedge clk)
    if(rst) begin
      temp_sum <= 0;
      final_sum <= 0;
    end else begin
      if(vld) begin 
        ind_sum <= a + b;
        temp_sum <= temp_sum + a + b;
        if(last) begin 
          final_sum <= temp_sum;
          temp_sum <= 0;
        end 
      end 
    end
    
    assign sum = final_sum;


endmodule