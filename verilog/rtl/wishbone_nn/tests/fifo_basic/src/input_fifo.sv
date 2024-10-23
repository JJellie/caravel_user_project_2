module fifo_buffer (
    input wire clk,
    input wire we,
    input wire rst,
    input wire ce,
    output wire full,
    input wire [31:0] data_i,
    output wire [31:0] data_o
    `ifdef USE_POWER_PINS
        inout vccd1,	// User area 1 1.8V supply
        inout vssd1,	// User area 1 digital ground
    `endif
);
    reg [31:0] FIFO [0:7];
    reg [2:0] count;
    reg [2:0] write_addr = 0, read_addr = 0;

    assign full = (count==8) ? 1'b1 : 1'b0;
    assign data_o = ce ? FIFO[read_addr] : 32'b0;
    initial begin
        count <= 0;
    end
    always @(posedge clk) begin
        if (rst) begin
            write_addr <= 0;
            read_addr <= 0;
            count <= 0;
        end
        else if (ce) begin
            if (we && count <= 8) begin
                FIFO[write_addr] = data_i;
                write_addr <= write_addr + 1;
                count <= count + 1;
            end
            else if (!we && count > 0) begin
                read_addr <= read_addr+1;
                count <= count - 1;
            end
        end
        if (write_addr == 8) begin
            write_addr <= 0;
        end 
        if (read_addr == 8) begin
            read_addr <= 0;
        end
    
    end
    

    `ifdef FORMAL
    // Formal verification with SymbiYosis
    always @(posedge clk) begin
        if (~rst) begin
            count_bound: assert (count <= 8 && count >= 0);
            r_addr_bound: assert (read_addr >= 0 && read_addr <= 7);
            w_addr_bound: assert (write_addr >= 0 && write_addr <= 7);

            count_change: assert(count == 0 || count == $past(count) || count == $past(count) + 1 || count == $past(count) - 1);
        end
    end
    `endif
endmodule
