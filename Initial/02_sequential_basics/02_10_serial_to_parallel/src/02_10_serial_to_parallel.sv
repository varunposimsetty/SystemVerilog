//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      serial_valid,
    input                      serial_data,

    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);
    // Task:
    // Implement a module that converts serial data to the parallel multibit value.
    //
    // The module should accept one-bit values with valid interface in a serial manner.
    // After accumulating 'width' bits, the module should assert the parallel_valid
    // output and set the data.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.

    logic [2:0] count;
    logic [width -1 : 0] data;
    logic [width-1:0] data_send;
    logic valid;

    always_ff @(posedge clk)
        if (rst) begin
            count <= 0;
            data <= 0;
        end else begin
            if (serial_valid == 1) begin
                count <= count + 1;
                valid <= 0;
                data <= {data[width-2:0],serial_data};
                if(count == width-1)
                    data_send <= data;
                    valid <= 1;
                    count <= 0;
                end 
            end 

        assign parallel_data = data_send;
        assign parallel_valid = valid;
endmodule