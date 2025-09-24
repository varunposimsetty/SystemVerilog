`timescale 1ns / 1ps
module BarrelShifter_Nbit 
#(N = 8)
(
    input logic [N-1:0] a,
    input logic [$clog2(N)-1:0] shiftamount,
    input logic direction, // 1 :- Shiftleft 0 :- ShiftRight
    output logic [N-1:0] shifted
);

logic [N-1:0] left_shift  [N-1:0];
logic [N-1:0] right_shift [N-1:0];

assign left_shift[0] = a;
assign right_shift[0] = a;

genvar i;
generate 
        for(i = 0; i < N; i++) begin 
            assign left_shift[i+1] = {left_shift[i][N-2:0],left_shift[i][N-1]};
            assign right_shift[i+1] = {right_shift[i][0],right_shift[i][N-1:1]};
        end
    endgenerate
    assign shifted = (direction) ? left_shift[shiftamount] : right_shift[shiftamount];
endmodule