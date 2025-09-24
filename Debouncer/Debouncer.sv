`timescale 1ns / 1ps
module ClockDivider
#(parameter m = 2, M = 2**m) //2-Bit decoder 
(
    input logic enable,
    input [m-1:0] n,
    output [(2**N)-1 :0] decoded
);

int value;
assign value = n;
assign decoded[value:0] = {value'b1};
assign decoded[(2**N)-1:value+1] = {(2**N - value)'b0};

endmodule