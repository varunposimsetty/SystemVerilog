module tb_top; // Testbench module
    // Signal declarations
    logic clk;
    logic rst;
    logic led;

    // Instantiate the DUT (Design Under Test)
    top dut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    // Generate clock signal
    initial begin
        clk = 0; // Initialize clock
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Initial block for testbench logic
    initial begin
        rst = 1; // Assert reset
        #10 rst = 0; // Release reset after 10 time units

        // Optionally reassert reset to observe behavior
        #10 rst = 1; // Reassert reset
        #5 rst = 0; // Release reset again

        // Dump waveforms
        $dumpfile("./work/result.vcd");
        $dumpvars(1, tb_top); // Dump all signals at level 1

        // Wait for enough time to observe output
        #100; // Adjust the time as required
        $finish; // End simulation
    end

endmodule // End of testbench module