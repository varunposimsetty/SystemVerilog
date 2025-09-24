`timescale 1ns / 1ps
module Celsius2Fahrenheit 
(
    input logic clk,
    input logic reset,
    input logic [7:0] celsius,
    output logic [7:0] fahrenheit
);

always @(posedge(clk)) begin 
    if(reset) begin 
        fahrenheit <= 0;
    end else begin
        fahrenheit <= (((celsius*9)/5) + 32);
    end
end 
endmodule