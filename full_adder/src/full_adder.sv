module full_adder(
    input logic A,
    input logic B,
    input logic C_in,
    output logic Sum,
    output logic C_out
);
 assign Sum = A^B^C_in;
 assign C_out = ((A && B) ^ (C_in && ( A ^ B)));
endmodule