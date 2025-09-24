//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module double_tokens
(
    input        clk,
    input        rst,
    input        a,
    output       b,
    output logic overflow
);
    // Task:
    // Implement a serial module that doubles each incoming token '1' two times.
    // The module should handle doubling for at least 200 tokens '1' arriving in a row.
    //
    // In case module detects more than 200 sequential tokens '1', it should assert
    // an overflow error. The overflow error should be sticky. Once the error is on,
    // the only way to clear it is by using the "rst" reset signal.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // a -> 10010011000110100001100100
    // b -> 11011011110111111001111110

    logic prev_a;
    logic [199:0] buffer;
    logic send,limit;
    logic [7:0] count;

    always_ff @(posedge clk)
        if (rst) begin
            count <= 0;
            limit <= 0;
        end else begin 
            if (a == 0) begin
                count <= count;
            end else if (a == 1 and limit == 0) begin
                count <= count + 1;
                if (count > 8'b11000110 ) begin 
                    limit <= 1;
                end else begin
                    limit <= 0;
                end
                
            end



                
        end 


endmodule