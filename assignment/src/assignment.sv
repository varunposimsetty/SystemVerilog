module assignment (
    input logic clk,
    input logic NRST,
    input logic start,
    input logic [10:0] A,
    input logic [10:0] B,
    output logic [20:0] result,
    output logic ready
);

    logic [10:0] a_value = 0; 
    logic [10:0] b_value = 0;
    int b_dec_value = 0;
    logic [20:0] mul_value = 0;
    logic [11:0] bcd = 0;
    logic [10:0] binary_round_0 = 0;
    logic [10:0] binary_round_1 = 0;
    logic [10:0] binary_round_2 = 0;
    logic [20:0] accumlator = 0;
    logic [1:0] state = 0; 

    always_ff @(posedge clk or negedge NRST) begin 
        if (NRST == 0) begin 
            result <= 0;
            ready <= 0;
            b_value <= 0;
            binary_round_0 <= 0;
            binary_round_1 <= 0;
            binary_round_2 <= 0;
            accumlator <= 0;
        end else if (start == 1) begin
            if (state == 0) begin 
                ready <= 0;
                accumlator <= 0;
                a_value <= A;
                b_value <= B;
                b_dec_value <= B; 
                state <= 1;
            end else if (state == 1) begin 
                binary_round_0 <= b_dec_value % 10; 
                binary_round_1 <= (b_dec_value / 10) % 10;
                binary_round_2 <= (b_dec_value / 100) % 10;
                mul_value <= $unsigned(a_value) * $unsigned(binary_round_0);
                accumlator <= accumlator + $unsigned(a_value) * $unsigned(binary_round_0);
                state <= 2;
            end else if (state == 2) begin 
                mul_value <= $unsigned(a_value) * $unsigned(binary_round_1);
                accumlator <= accumlator + $unsigned(a_value) * $unsigned(binary_round_1);
                state <= 3;
            end else if (state == 3) begin 
                mul_value <= $unsigned(a_value) * $unsigned(binary_round_2);
                accumlator <= accumlator + $unsigned(a_value) * $unsigned(binary_round_2);
                result <= accumlator + $unsigned(a_value) * $unsigned(binary_round_2);
                ready <= 1;
                state <= 0;
            end 
        end 
    end 
endmodule
