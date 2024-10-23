set -e
iverilog -o test ../../../gl/wishbone_nn.v $1 -DFUNCTIONAL -DSIM -DUSE_POWER_PINS -DUNIT_DELAY=#1 -DGL -I $PDK_ROOT/sky130A
vvp test -fst
gtkwave tb_wishbone_nn.vcd

# `include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
# `include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"