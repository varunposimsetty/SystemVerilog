
module testbench;

  logic a, b, o;
  int i, j;

  and_gate_using_mux inst (a, b, o);

  initial
    begin
      $dumpfile("./work/dump.vcd");
      $dumpvars(0, testbench);
      for (i = 0; i <= 1; i++)
        for (j = 0; j <= 1; j++)
        begin
          # 5  a = 1' (i);
          # 10 b = 1' (j);
        end 

        # 10;

      $finish;
    end

endmodule