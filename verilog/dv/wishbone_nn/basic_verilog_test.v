//`include "../../top_level.v"
`default_nettype none
`timescale 1 ns / 1 ps
module tb_wishbone_nn;
reg clk;
reg rst_n;
reg wbs_stb_i;
reg wbs_cyc_i;
reg wbs_we_i;
reg [3:0] wbs_sel_i;
reg [31:0] wbs_dat_i;
reg [31:0] wbs_adr_i;
wire wbs_ack_o;
wire [31:0] wbs_dat_o;
reg [31:0] test_reg;
 
wishbone_nn nn0 (
    .wb_clk_i(clk),
    .wb_rst_i(rst_n),
    .wbs_stb_i(wbs_stb_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o)
);

localparam CLK_PERIOD = 2;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_wishbone_nn.vcd");
    $dumpvars(0, tb_wishbone_nn);
end

task strobe_ack_test; begin
    wbs_adr_i <= 32'h30000000;
    #2;
    wbs_cyc_i <= 1'b1;
    #2;
    wbs_stb_i <= 1'b1;
    #2;
    wbs_stb_i <= 1'b0;
    wbs_cyc_i <= 1'b0;
end
endtask

task fifo_write(input [31:0] data); begin
    // master presents address and data
    wbs_adr_i <= 32'h30000000;
    wbs_dat_i <= data;
    wbs_we_i <= 1'b1;
    // master asserts cyc and strobe
    wbs_stb_i <= 1'b1;
    wbs_cyc_i <= 1'b1;
    @(posedge clk); // Write edge 0

    // Master stops single write
    @(posedge clk); // Write edge 1
    wbs_stb_i <= 1'b0;
    wbs_cyc_i <= 1'b0;

    // Deadabba should now be written to fifo spot 1
end
endtask

task fifo_read; begin
        // Master pulls down we to indicate read cycle
    wbs_we_i <= 1'b0;
    wbs_stb_i <= 1'b1;
    wbs_cyc_i <= 1'b1;
    @(posedge clk); // Read edge 0
    
    // Prepare to latch data
    test_reg <= wbs_dat_o;
    @(posedge clk); // Read edge 1
    wbs_stb_i <= 1'b0;
    wbs_cyc_i <= 1'b0;
end
endtask

task triplewrite; begin
    fifo_write(32'habba);
    @(posedge clk); // Write edge 0
    fifo_write(32'hdead0000);
    @(posedge clk); // Write edge 0
    fifo_write(32'hdeadabba);
    @(posedge clk); // Write edge 0
    fifo_read();
    @(posedge clk); // Write edge 0
    fifo_read();
    @(posedge clk); // Write edge 0
    fifo_read();
    @(posedge clk); // Write edge 0
end
endtask

initial begin
    clk <= 1'b0;
    // initial reset
    rst_n <= 1'b1;
    wbs_stb_i <= 1'b0;
    wbs_cyc_i <= 1'b0;
    wbs_we_i <= 1'b0;
    test_reg <= 0;
    @(posedge clk) rst_n <= 1'b0;
    @(posedge clk);
    // Run simple ack test
    // #2 strobe_ack_test();
    // Run test for read and write
    triplewrite();
    // End test bench
    #5 $finish(2);
end

endmodule
`default_nettype wire
