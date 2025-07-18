module testbench;
    logic clk, rst, a, b, sum;

    serial_adder_using_logic_operations_only dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .sum(sum)
    );

    int i,j;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    

    initial begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);

        rst = 1; a = 0; b = 0;
        #10 rst = 0;
        #30 a = 1; b = 0;

        for (i = 0; i <= 11; i++)
        for (j = 0; j <= 11; j++)
        begin
          # 5  a = 1' (i);
          # 10 b = 1' (j);
        end 




        #100 rst = 1;
        #400 rst = 0;
        #500 rst = 1;
        #60 $finish;
    end
endmodule