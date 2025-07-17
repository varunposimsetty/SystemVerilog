module testbench;
    logic [3:0] d0,d1,d2,d3;
    logic [1:0] sel;
    logic [3:0] y;


    mux_4_1 inst 
    (
        .d0 (d0), .d1 (d1), .d2 (d2), .d3 (d3),
        .sel (sel),
        .y (y)

    );

    initial begin
        
        $dumpfile("./work/dump.vcd");
        $dumpvars(0, testbench);
        d0 = 0 ; d1 = 0 ; d2 = 0 ; d3 = 0; sel = 0;
        #10 d0 = 'ha ; d1 = 'hb ; d2 = 'hc ; d3 = 'hd; sel = 0;
        #10 d0 = 'ha ; d1 = 'hb ; d2 = 'hc ; d3 = 'hd; sel = 1;
        #10 d0 = 'ha ; d1 = 'hb ; d2 = 'hc ; d3 = 'hd; sel = 2;
        #10 d0 = 'ha ; d1 = 'hb ; d2 = 'hc ; d3 = 'hd; sel = 3;
        #10 d0 =   7 ; d1 =  10 ; d2 =   3 ; d3 =  'x; sel = 0;
        #10 d0 =   7 ; d1 =  10 ; d2 =   3 ; d3 =  'x; sel = 1;
        #10 d0 =   7 ; d1 =  10 ; d2 =   3 ; d3 =  'x; sel = 2;
        #10 d0 =   7 ; d1 =  10 ; d2 =   3 ; d3 =  'x; sel = 3;
        #10 d0 =   7 ; d1 =  10 ; d2 =   3 ; d3 =  'x; sel = 2;
        #50 $finish;
    end
endmodule
