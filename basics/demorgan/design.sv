`timescale 1ns/1ns
module labtop
#(
    parameter w_key = 4, 
              w_led = 8
) 
(
    input logic [w_key-1:0] key,
    output logic [w_led-1 :0] led
);

wire a = key[0];
wire b = key[1];
wire result = a ^ b;

assign led[0] = result;
assign led[1] = key[0] ^ key[1];
assign led[2] = a & b;
assign led[3] = (~a & b) | (a & ~b);
//Proving De-Morgans Laws
assign led[4] = ~(a&b);
assign led[5] = ~a | ~b;
assign led[6] = ~(a|b);
assign led[7] = ~a & ~b;

endmodule