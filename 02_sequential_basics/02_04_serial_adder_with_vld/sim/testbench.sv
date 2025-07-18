module testbench;
    logic clk, rst, vld, a, b, last;
    logic [7:0] sum;

    serial_adder_with_vld dut (
        .clk(clk),
        .rst(rst),
        .vld (vld),
        .a(a),
        .b(b),
        .last(last),
        .sum(sum)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

   
    initial begin
        rst = 1; 
        # 20 rst = 0; vld = 1;
        forever #5000 rst = ~ rst;
    end

    initial begin
        vld = 0; 
        # 20 vld = 1;
        forever #498  vld = ~ vld;
    end

    initial begin
        last = 0;
        # 20 last = 1;
        forever #321 last = ~last;
    end
    
   
    initial begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);
    end

    
    initial begin
        
        a = 0; 
        b = 0;

        
        for (int i = 0; i < 280; i++) begin
            for (int j = 0; j < 182; j++) begin
                @(posedge clk); 
                a = i[0];       
                b = j[0];       

            end
        end
        $finish;
    end
endmodule