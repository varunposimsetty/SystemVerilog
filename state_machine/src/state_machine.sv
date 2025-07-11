module state_machine(
    input logic clk,
    input logic NRST,
    input logic start,
    input logic rst,
    input logic CIN,
    input logic A,
    input logic B,
    output logic S,
    output logic COUT
);

   logic [1:0] state,next_state;

     
 always_ff @(posedge clk or negedge NRST) 
    begin 
        if(NRST == 0) 
            begin 
                state <= 00;
                S <= 0;
                COUT <= 0;
            end 
        else begin
            state <= next_state;
            case (state)
                00 : 
                    S <= 0;
                    COUT <= 0;
                    if(start == 1) begin 
                        next_state <= 01;
                    end 
                01 : 
                    S <= A^B^CIN;
                    COUT <= 0;
                    if(rst == 0) begin 
                        next_state <= 10;
                    end else if (rst == 1) begin
                        next_state <= 00;
                    end
                10 : 
                    S <= 0;
                    COUT <= ((A & B) ^ (CIN & ( A ^ B)));
                    if(rst == 0) begin 
                        next_state <= 11;
                    end else if (rst == 1) begin
                        next_state <= 00;
                    end
                11 : 
                    S <= A^B^CIN;
                    COUT <= ((A & B) ^ (CIN & ( A ^ B)));
                    if(rst == 1) begin 
                        next_state <= 00;
                    end 
                default : begin 
                    next_state <= 00;
                end
            endcase
        end
    end 
endmodule