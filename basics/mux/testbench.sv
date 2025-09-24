`timescale 1ns/1ns

module testbench;

logic [3:0] test_a = '0;
logic [1:0] test_sel = '0;
logic test_z;

mux4 #() mux (.a(test_a), .sel(test_sel), .z(test_z));

initial begin 
        $dumpfile("work/result.vcd");
        $dumpvars(0,testbench);
        repeat(50)
        begin 
            #10 
            test_a <= $random();
            test_sel <= $random();
        end 
        $finish;
end 
endmodule