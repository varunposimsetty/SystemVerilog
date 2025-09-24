module testbench;

  logic a, o;
  int i = 0;

  not_gate_using_mux inst (a, o);

  initial
    begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);
        for (i = 0; i <= 10; i++)
            begin
                # 10 a = 1' (i);
            end 

        # 1;

      $finish;
    end

endmodule