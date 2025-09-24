module tb_full_adder; 
    
    logic A;
    logic B;
    logic C_in;
    logic Sum;
    logic C_out;

    full_adder dut (
        .A(A),
        .B(B),
        .C_in(C_in),
        .Sum(Sum),
        .C_out(C_out)
    );

    
    initial 
        begin
            $dumpfile("./work/result.vcd");
            $dumpvars(1, tb_full_adder); 
            A = 0; B = 0; C_in = 0;

            #10 A = 1; B = 0; C_in = 1;
            #10 B = 1; 
            #30 C_in = 0;
            #50 B = 0;
            #5 A = 0; B = 1
            #100;
            $finish; 
        end

endmodule 