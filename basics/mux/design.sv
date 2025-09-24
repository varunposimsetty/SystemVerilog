`timescale 1ns/1ps
module mux4 (
    input logic [3:0] a,
    input logic [1:0] sel,
    output logic z
);


always_comb 
    z = (a[0]&~sel[0]&~sel[1]) | (a[1]&sel[0]&~sel[1]) | (a[2]&~sel[0]&sel[1]) | (a[3]&sel[0]&sel[1]);
endmodule