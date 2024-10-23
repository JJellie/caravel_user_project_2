set -e
iverilog -o test ../top_level.v ../input_fifo.v $1 -DFUNCTIONAL -DSIM -DUSE_POWER_PINS
vvp test -fst
gtkwave tb_wishbone_nn.vcd