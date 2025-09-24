module testbench;
    logic clk, rst;
    logic [15:0] num, num2;

    fibonacci_2 dut (
        .clk(clk),
        .rst(rst),
        .num(num),
        .num2(num2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);

        rst = 1;
        #10 rst = 0;
        #100 rst = 1;
        #400 rst = 0;
        #500 rst = 1;
        #60 $finish;
    end
endmodule