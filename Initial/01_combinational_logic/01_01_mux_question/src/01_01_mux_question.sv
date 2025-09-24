module mux_2_1 (
    input [3:0] d0,d1,
    input       sel,
    output [3:0] y
);

assign y = sel ? d1 : d0;
    
endmodule

module mux_4_1 (
    input [3:0] d0, d1, d2, d3,
    input [1:0] sel,
    output [3:0] y
);

    //if (sel[1] == 1) begin 
    //    assign y = sel[0] ? d3 : d2;
    //end else begin 
    //    assign y = sel[0] ? d1 : d0;
    //end 

    assign y = sel[1] ? (sel[0] ? d3 : d2) : (sel[0] ? d1 : d0);

endmodule