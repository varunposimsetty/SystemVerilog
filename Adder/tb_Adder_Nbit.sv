`timescale 1ns / 1ps

module tb_Adder_Nbit;
localparam N = 4;
logic [N - 1 : 0] test_in0, test_in1;
logic [N - 1 : 0] test_out;
logic carryOut;

Adder_Nbit #(.N(N)) adder(.a(test_in0), .b(test_in1), .sum(test_out), .carryout(carryOut));

initial begin
    $dumpfile("work/result.vcd");
    $dumpvars(0, tb_Adder_Nbit);
    for(int i = 0; i < (2**N); ++i) begin
        for(int k = 0; k < (2**N); ++k) begin
            test_in0 = i;
            test_in1 = k;
            #20;        
        end
    end
    
    $stop;
end
endmodule