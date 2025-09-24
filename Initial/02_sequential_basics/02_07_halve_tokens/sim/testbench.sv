module testbench;

    logic clk;
    logic rst;

    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial
    begin
        rst <= '1;
        #50;
        rst <= '0;
    end

    logic a, half_b;
    halve_tokens i_halve_tokens
    (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(half_b)
    );

    initial
    begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);

        a <= 0;
        #100 a <= 1;
        #20 a <= 0;
        #20 a <= 1;
        #30 a <= 0;
        #10 a <= 1;
        #10 a <= 0;
        #30 a <= 1;
        #10 a <= 1;
        #20
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b0;
        #10;
        a <= 1'b0;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b0;
        #10;
        a <= 1'b0;
        #10;
        a <= 1'b0;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;
        a <= 1'b1;
        #10;

        
        a <= 1'b0;
        for(int i = 0; i < 100; i++)
        begin
            #15 a <= $random() % 2;
        end

        $finish;
    end
endmodule