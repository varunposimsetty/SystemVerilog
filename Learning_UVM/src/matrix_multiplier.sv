module matrix_multiplier(
    input logic clk,
    input logic NRST,
    input logic start,
    input logic [7:0] A,
    input logic [7:0 ]B,
    output logic [16:0] out,
    output logic out_strobe
);

   logic [16:0] temp_mul = 0;
   logic [16:0] accumlator = 0;
   logic [1:0] state,next_state = 0; 
   logic [7:0] x0,x1,y0,y1 = 0;

always_ff @(posedge clk or negedge NRST) begin 
    if(NRST == 0) begin 
        state <= 0;
        out <= 0;
        out_strobe <= 0;
        x0 <= 0;
        x1 <= 0;
        y0 <= 0;
        y1 <= 0;
        temp_mul <= 0;
        accumlator <= 0;
        next_state <= 0;
    end else begin
            if  (start == 1) begin 
                if (state == 0) begin 
                    out_strobe <= 0;
                    x0 <= A;
                    y0 <= B; 
                    temp_mul <=  $signed(A) * $signed(B);
                    accumlator <=  $signed(A) * $signed(B);
                    state <= 1;
                end else if (state == 1) begin 
                    x1 <= A;
                    y1 <= B;
                    temp_mul <=  $signed(A) * $signed(B);
                    accumlator <= $signed(accumlator)  + $signed($signed(A) * $signed(B));
                    state <= 2;
                end else if(state == 2) begin 
                    out <= accumlator;
                    out_strobe <= 1;
                    state <= 0;
                end 
            end
        end
    end 
endmodule

