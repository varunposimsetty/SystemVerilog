//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output [1:0] grants
);
    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01

    logic [1:0] prev;
    logic [1:0] chosen;

    always_ff @(posedge clk) begin 
        if (rst) begin
            prev <= 2'b01;
            chosen <= 2'b00;
        end else begin 
            case (requests) 
                2'b00 : chosen <= 2'b00;
                2'b01 : chosen <= 2'b01;
                2'b10 : chosen <= 2'b10;
                2'b11 : begin 
                        //if (prev == 2'b01) begin 
                        //    chosen <= 2'b10;
                        //    prev <= 2'b10;
                        //end else begin 
                        //    chosen <= 2'b01;
                        //    prev <= 2'b01;
                        //end 
                        chosen <= {~prev[1],~prev[0]};
                        prev <= {~prev[1],~prev[0]};
                    end 
                default : chosen <= chosen; 
            endcase
        end 
    end 
    assign grants = chosen;
endmodule