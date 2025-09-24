module testbench;
    logic clk, rst;
    logic [1:0] requests, grants;
    
    round_robin_arbiter_with_2_requests dut (
        .clk(clk),
        .rst(rst),
        .requests (requests),
        .grants(grants)
    );

   
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

   
    initial begin
        rst = 1; 
        # 20 rst = 0;
        forever #5000 rst = ~ rst;
    end
   
    initial begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);
    end

    
    initial begin
        
        requests[0] = 0; 
        requests[1] = 0;

        
        for (int i = 0; i < 280; i++) begin
            for (int j = 0; j < 182; j++) begin
                @(posedge clk); 
                requests[0] = $random() %2;       
                requests[1] = $random() %2;    
                #100 requests = 2'b11;
            end
        end
        $finish;
    end
endmodule