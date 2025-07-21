module testbench;

    logic clk;
    logic rst;

    // Clock generation
    initial
    begin
        clk = '0;
        forever
            #10 clk = ~clk;
    end

    // Reset sequence
    initial
    begin
        rst <= '1;
        #10;
        rst <= '0;
        #10000 rst <= 1;
        #10 rst <= 0;
    end

    // Instantiate the design under test
    logic serial_valid;
    logic serial_data;
    logic parallel_valid;
    logic [7:0] parallel_data;

    serial_to_parallel #(.width(8)) dut (
        .clk      (clk         ),
        .rst      (rst         ),
        .serial_valid (serial_valid),
        .serial_data  (serial_data ),
        .parallel_valid(parallel_valid),
        .parallel_data (parallel_data)
    );

    // Waveform dumping
    initial
    begin
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);

        serial_valid = 0;


        
        for (int i = 0; i < 280; i++) begin
            for (int j = 0; j < 182; j++) begin
                @(posedge clk); 
                serial_valid = 1;       
                serial_data = $random() %2;    
            end
        end
        
        
        $finish;
    end
endmodule