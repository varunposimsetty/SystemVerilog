module top(
    input logic clk,
    input logic rst,
    output logic led
);

always_ff @(posedge clk or negedge rst) begin
    if (rst) 
        led <= 0;
    else
        led <= ~led;
    end
endmodule