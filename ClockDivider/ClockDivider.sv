`timescale 1ns / 1ps
module ClockDivider
#(parameter rawClockFreq = 100_000_000, desiredClockFreq = 1_000_000) 
(
    input logic clk,
    output logic dividedClock
);

localparam int  RATIO = rawClockFreq/desiredClockFreq;
localparam int BITS = $clog2((RATIO));
logic [BITS-1:0] counter = 0;

always_ff @(posedge(clk)) begin
    if(counter < BITS-1)
        counter <= counter + 1;
    else
        counter <= 0;
end

assign dividedClock = (counter == 0) ? 1 : 0; 

endmodule