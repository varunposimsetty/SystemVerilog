module testbench;

  logic clk;

  initial
    begin
      clk = '0;
      forever # 500 clk = ~ clk;
    end

  logic rst;

  initial
    begin
      rst <= 'x;
      repeat (2) @ (posedge clk);
      rst <= '1;
      repeat (2) @ (posedge clk);
      rst <= '0;
    end

  logic a, pd_detected, ocpd_detected;

  posedge_detector         pd   (.detected (pd_detected),   .*);
  one_cycle_pulse_detector ocpd (.detected (ocpd_detected), .*);

  localparam n = 16;

  // Sequence of input values
  localparam [n - 1:0] seq_a                = 16'b1000111001000100;

  // Expected sequence of correct output values
  localparam [n - 1:0] seq_posedge          = 16'b1000001001000100;
  localparam [n - 1:0] seq_one_cycle_pulse  = 16'b0000000010001000;

  initial
  begin
      $dumpfile("./work/dump.vcd");
      $dumpvars(0, testbench);

      @ (negedge rst);
      for (int i = 0; i < n; i ++)
      begin
        # 10 a <= seq_a [i];
    end

    $finish;
  end

endmodule