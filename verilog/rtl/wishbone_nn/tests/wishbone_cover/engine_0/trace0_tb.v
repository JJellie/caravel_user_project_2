`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [31:0] PI_wbs_adr_i;
  reg [0:0] PI_wbs_we_i;
  reg [0:0] PI_wb_rst_i;
  reg [3:0] PI_wbs_sel_i;
  reg [31:0] PI_wbs_dat_i;
  reg [0:0] PI_wb_clk_i;
  reg [0:0] PI_wbs_stb_i;
  reg [0:0] PI_wbs_cyc_i;
  wishbone_nn UUT (
    .wbs_adr_i(PI_wbs_adr_i),
    .wbs_we_i(PI_wbs_we_i),
    .wb_rst_i(PI_wb_rst_i),
    .wbs_sel_i(PI_wbs_sel_i),
    .wbs_dat_i(PI_wbs_dat_i),
    .wb_clk_i(PI_wb_clk_i),
    .wbs_stb_i(PI_wbs_stb_i),
    .wbs_cyc_i(PI_wbs_cyc_i)
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.$auto$async2sync.\cc:101:execute$190  = 1'b0;
    // UUT.$auto$async2sync.\cc:101:execute$196  = 1'b0;
    // UUT.$auto$async2sync.\cc:110:execute$194  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$200  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$206  = 1'b1;
    // UUT.$auto$async2sync.\cc:110:execute$212  = 1'b1;
    // UUT.fifo_in.$auto$async2sync.\cc:101:execute$214  = 1'b0;
    // UUT.fifo_in.$auto$async2sync.\cc:110:execute$218  = 1'b1;
    // UUT.fifo_in.$auto$async2sync.\cc:110:execute$224  = 1'b1;
    // UUT.fifo_in.$auto$async2sync.\cc:110:execute$230  = 1'b1;
    UUT.fifo_in.count = 3'b000;
    UUT.fifo_in.read_addr = 3'b000;
    UUT.fifo_in.write_addr = 3'b000;
    UUT.fifo_in.FIFO[3'b000] = 32'b00000000000000000000000000000000;

    // state 0
    PI_wbs_adr_i = 32'b00110000000000000000000000000001;
    PI_wbs_we_i = 1'b0;
    PI_wb_rst_i = 1'b0;
    PI_wbs_sel_i = 4'b0000;
    PI_wbs_dat_i = 32'b00000000000000000000000000000000;
    PI_wb_clk_i = 1'b0;
    PI_wbs_stb_i = 1'b1;
    PI_wbs_cyc_i = 1'b1;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_wbs_adr_i <= 32'b00000000000000000000000000000000;
      PI_wbs_we_i <= 1'b0;
      PI_wb_rst_i <= 1'b0;
      PI_wbs_sel_i <= 4'b0000;
      PI_wbs_dat_i <= 32'b00000000000000000000000000000000;
      PI_wb_clk_i <= 1'b0;
      PI_wbs_stb_i <= 1'b0;
      PI_wbs_cyc_i <= 1'b0;
    end

    genclock <= cycle < 1;
    cycle <= cycle + 1;
  end
endmodule
