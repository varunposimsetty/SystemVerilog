//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  // Task:
  // Create an one cycle pulse (010) detector.
  //
  // Note:
  // See the testbench for the output format ($display task).
  
  logic [2:0] check = 3'b111;
  logic pulse;

  always_ff @(posedge clk) begin
    if(rst) begin 
      check <= 0;
    end else begin
      check <= {check[1:0],a};
      if({check[1:0],a} == 3'b010) begin 
        pulse <= 1;
      end else begin
        pulse <= 0;
      end
    end
  end;
  assign detected = pulse;
endmodule