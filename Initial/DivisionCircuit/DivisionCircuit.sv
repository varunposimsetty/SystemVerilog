`timescale 1ns / 1ps
module Decoder_2bit
#(parameter m = 2, M = 2**m) //2-Bit decoder 
(
    input logic enable,
    input logic [m-1:0] n,
    output logic [M-1 :0] decoded
);

assign decoded = enable ? ((1 << (n+1) - 1)) : '0;

endmodule