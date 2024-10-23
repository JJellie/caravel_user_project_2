// `include "input_fifo.v"
// `include "wishbone_nn/input_fifo.v"

module wishbone_nn #(
    parameter [31:0] IO_ADDRESS = 32'h30000000,
    parameter [31:0] PROGRAMMABLE_ADDRESS = IO_ADDRESS + 1
    )(
    `ifdef USE_POWER_PINS
        inout vccd1,	// User area 1 1.8V supply
        inout vssd1,	// User area 1 digital ground
    `endif
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    input wire [3:0] wbs_sel_i,
    input wire [31:0] wbs_dat_i,
    input wire [31:0] wbs_adr_i,
    output wire wbs_ack_o,
    output wire [31:0] wbs_dat_o
);
    wire full;
    wire [31:0] fifo_out;
    wire enable;
    assign enable = IO_ADDRESS == wbs_adr_i;
    fifo_buffer fifo_in (
        `ifdef USE_POWER_PINS
            .vccd1(vccd1),	// User area 1 1.8V supply
            .vssd1(vssd1),	// User area 1 digital ground
        `endif
        .clk(wb_clk_i),
        .we(wbs_we_i),
        .rst(wb_rst_i),
        .ce(enable),
        .full(full),
        .data_i(wbs_dat_i),
        .data_o(fifo_out)
    );
    
    assign wbs_ack_o = (wbs_stb_i && wbs_cyc_i && !wb_rst_i && (wbs_adr_i == IO_ADDRESS || wbs_adr_i == PROGRAMMABLE_ADDRESS)) ? 1'b1 : 1'b0;
    // assign wbs_dat_o = (wbs_adr_i == IO_ADDRESS && !wbs_we_i && !wb_rst_i) ? fifo_out : fifo_out;
    assign wbs_dat_o = fifo_out;
    
    `ifdef FORMAL
        always @(posedge wb_clk_i) begin
            if (~wb_rst_i) begin
                // Is able to ack while reset is low
                will_ack: cover (wbs_ack_o);

                // Can only ack if master initiates a read or write cycle to this slave
                a_ack_only_when_stb_and_cyc: assert(!wbs_ack_o || (wbs_stb_i && wbs_cyc_i));
                a_ack_only_when_addr: assert(!wbs_ack_o || (wbs_adr_i == IO_ADDRESS || wbs_adr_i == PROGRAMMABLE_ADDRESS));
                
            end else if (wb_rst_i) begin

                // Can not pull ack or data high when rst is high
                ack_dat_low: assert(!wbs_ack_o && !wbs_dat_o);
            end
        end
    `endif

endmodule

