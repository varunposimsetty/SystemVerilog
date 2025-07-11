
module tb_state_machine;

    logic clk, NRST, start, rst, CIN, A, B;
    logic S, COUT;

    
    state_machine uut (
        .clk(clk),
        .NRST(NRST),
        .start(start),
        .rst(rst),
        .CIN(CIN),
        .A(A),
        .B(B),
        .S(S),
        .COUT(COUT)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial 
        begin
        $dumpfile("./work/result.vcd");
        $dumpvars(1, tb_state_machine); 
        
        NRST = 0; start = 0; rst = 0; CIN = 0; A = 0; B = 0;

       
        #10 NRST = 1; 
        
        #10 start = 1; A = 1; B = 0; CIN = 1; 
        #20 rst = 0;                          
        #10 rst = 0;                          
        #10 rst = 1;
        #10 start = 1; A = 1; B = 1; CIN = 0; 
        #20 rst = 0;                          
        #10 rst = 0;                          
        #10 rst = 1;                          
        #10 start = 1; A = 1; B = 1; CIN = 1; 
        #20 rst = 0;                          
        #10 rst = 0;                          
        #10 rst = 1;  
        #10 start = 1; A = 1; B = 0; CIN = 0; 
        #20 rst = 0;                          
        #10 rst = 0;                          
        #10 rst = 1;            

        #50 $finish; 
    end
endmodule