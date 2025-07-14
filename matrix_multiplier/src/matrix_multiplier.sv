module matrix_multiplier(
    input logic clk,
    input logic NRST,
    input logic start,
    input logic [7:0] A,
    input logic [7:0 ]B,
    output logic [16:0] out,
    output logic out_strobe
);

   logic [14:0] temp_mul0, temp_mul1;
   logic [15]
   logic [1:0] state; 

     
 always_ff @(posedge clk or negedge NRST) begin 
        if(NRST == 0) begin 
                state <= {2{1'b0}};
                out <= {17{1'b0}};
                out_strobe <= 0;
                temp_mul0 <= {15{1'b0}};
                temp_mul1 <= {15{1'b0}};
        end else begin
            state <= next_state;
            
            case (state)
                2'b00 : begin
                    S <= 0;
                    COUT <= 0;
                    if(start == 1) begin 
                        next_state <= 2'b01;
                    end else if (start == 0) begin 
                        state <= 2'b00;
                    end 
                end 
                2'b01 : begin 
                    S <= A^B^CIN;
                    COUT <= 0;
                    if(rst == 0) begin 
                        next_state <= 2'b10;
                    end else if (rst == 1) begin
                        next_state <= 2'b00;
                    end
                end
                2'b10 : begin 
                    S <= 0;
                    COUT <= ((A && B) ^ (CIN && ( A ^ B)));
                    if(rst == 0) begin 
                        next_state <= 2'b11;
                    end else if (rst == 1) begin
                        next_state <= 2'b00;
                    end
                end 
                2'b11 : begin
                    S <= A^B^CIN;
                    COUT <= ((A && B) ^ (CIN && ( A ^ B)));
                    if(rst == 1) begin 
                        next_state <= 2'b00;
                    end 
                end 
                default : begin 
                    S <= 0;
                    COUT <= 0;
                    next_state <= 2'b00;
                end
            endcase
        end
    end 
endmodule