`timescale 1ns/1ns

module testbench;
localparam w_key = 4;
localparam w_led = 8;

logic [w_key-1:0] test_key;
logic [w_led-1 :0] test_led;

labtop #(.w_key(w_key), .w_led(w_led)) labtop(.key(test_key), .led(test_led));

initial begin 
        $dumpfile("work/result.vcd");
        $dumpvars(0,testbench);
        repeat(20)
        begin 
            #10 
            test_key <= $random();
        end 
        $finish;
end 
endmodule