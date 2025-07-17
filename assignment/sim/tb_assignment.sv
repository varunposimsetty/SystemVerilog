
module tb_assignment;

    logic clk, NRST, start;
    logic [10:0] A, B;
    logic [20:0] result; 
    logic ready;

    
    assignment uut (
        .clk(clk),
        .NRST(NRST),
        .start(start),
        .A(A),
        .B(B),
        .result(result),
        .ready(ready)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    
    initial 
        begin
        $dumpfile("./work/result.vcd");
        $dumpvars(0, tb_assignment); 
        
        NRST = 0; start = 0; A = 0; B = 0;

        #10 NRST = 1; 
        
        #10 start = 1; A = 11'h111; 
        #10 B = 11'h222;
        #10 A = 11'h234; 
        #19 B = 11'h345; 
        #10 A = 11'h765; 
        #20 B = 11'h102;                          
        #10 A = 11'h567; 
        #11 B = 11'h091;
        #10 A = 11'h081; 
        #12 B = 11'h102;
        #10 A = 11'h003; 
        #24 B = 11'h040; 
        #10 A = 11'h049; 
        #21 B = 11'h050;                          
        #10 A = 11'h120; 
        #10 B = 11'h010;
        #10 A = 11'h010; 
        #12 B = 11'h120;
        #10 A = 11'h003; 
        #15 B = 11'h004; 
        #10 A = 11'h040; 
        #12 B = 11'h050;                          
        #10 A = 11'h12; B = 11'h01;
        #10 A = 11'h01; B = 11'h12;
        #10 A = 11'h03; B = 11'h04; 
        #10 A = 11'h04; B = 11'h05;                          
        #10 A = 11'h12; B = 11'h01;
        #10 A = 11'h01; B = 11'h12;
        #10 A = 11'h03; B = 11'h04; 
        #10 A = 11'h04; B = 11'h05;                          
        #10 A = 11'h12; B = 11'h01;
        #10 A = 11'h01; B = 11'h12;
        #10 A = 11'h03; B = 11'h04; 
        #10 A = 11'h04; B = 11'h05;                          
        #10 A = 11'h12; B = 11'h01;
        #10 A = 11'h01; B = 11'h12;
        #50 $finish; 
    end
endmodule