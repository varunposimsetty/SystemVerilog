//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module halve_tokens
(
    input  clk,
    input  rst,
    input  a,
    output b
);
    // Task:
    // Implement a serial module that reduces amount of incoming '1' tokens by half.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 110_011_101_000_1111
    // b -> 010_001_001_000_0101

    logic pulse = 0;
    logic [1:0] count = 0;
    logic a_c = 0;

    always_ff @(posedge clk)
        if(rst) begin
            pulse <= 0;
            count <= 0;
        end else begin 
            if (a == 1 & count == 1) begin
                pulse <= 1;
                count <= 0;
            end else if (a == 1 & count == 0) begin 
                count <= count + 1;
                pulse <= 0;
            end else begin
                pulse <= 0;
            end 
        end
        assign b = pulse;
endmodule