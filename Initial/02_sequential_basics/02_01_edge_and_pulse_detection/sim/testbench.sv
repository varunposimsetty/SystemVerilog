module testbench;

  logic clk;

  initial
    begin
      clk = 0;
      forever # 10 clk = ~ clk;
    end

  logic rst;

  initial
    begin
      rst <= '1;
      #20 rst <= '0;
    end

  logic a, ocpd_detected;

  one_cycle_pulse_detector ocpd (.detected (ocpd_detected), .*);

  initial
  begin
      $dumpfile("./work/dump.vcd");
      $dumpvars(0, testbench);

      for (int i = 0; i < 100; i ++)
      begin
        # 10 a <= $random() %2;
    end

    $finish;
  end

endmodule