
module tb_matrix_multiplier;

    logic clk, NRST, start;
    logic [7:0] A, B;
    logic [16:0] out; 
    logic out_strobe;

    
    matrix_multiplier uut (
        .clk(clk),
        .NRST(NRST),
        .start(start),
        .A(A),
        .B(B),
        .out(out),
        .out_strobe(out_strobe)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial 
        begin
        $dumpfile("./work/result.vcd");
        $dumpvars(0, tb_matrix_multiplier); 
        
        NRST = 0; start = 0; A = 0; B = 0;

        #10 NRST = 1; 
        
        #10 start = 1; A = 8'h01; 
        #10 B = 8'h02;
        #10 A = 8'h03; 
        #19 B = 8'h04; 
        #10 A = 8'h04; 
        #20 B = 8'h05;                          
        #10 A = 8'h12; 
        #11 B = 8'h01;
        #10 A = 8'h01; 
        #12 B = 8'h12;
        #10 A = 8'h03; 
        #24 B = 8'h04; 
        #10 A = 8'h04; 
        #21 B = 8'h05;                          
        #10 A = 8'h12; 
        #10 B = 8'h01;
        #10 A = 8'h01; 
        #12 B = 8'h12;
        #10 A = 8'h03; 
        #15 B = 8'h04; 
        #10 A = 8'h04; 
        #12 B = 8'h05;                          
        #10 A = 8'h12; B = 8'h01;
        #10 A = 8'h01; B = 8'h12;
        #10 A = 8'h03; B = 8'h04; 
        #10 A = 8'h04; B = 8'h05;                          
        #10 A = 8'h12; B = 8'h01;
        #10 A = 8'h01; B = 8'h12;
        #10 A = 8'h03; B = 8'h04; 
        #10 A = 8'h04; B = 8'h05;                          
        #10 A = 8'h12; B = 8'h01;
        #10 A = 8'h01; B = 8'h12;
        #10 A = 8'h03; B = 8'h04; 
        #10 A = 8'h04; B = 8'h05;                          
        #10 A = 8'h12; B = 8'h01;
        #10 A = 8'h01; B = 8'h12;
        #50 $finish; 
    end
endmodule