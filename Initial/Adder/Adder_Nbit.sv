`timescale 1ns / 1ps

module Adder_Nbit 
#(parameter N = 4)
(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    output logic [N-1:0] sum,
    output logic carryout
);

logic [N:0] sumInternal;

assign sumInternal = {1'b0,a} + {1'b0,b};
assign sum = sumInternal[N-1:0];
assign carryout = sumInternal[N];

endmodule