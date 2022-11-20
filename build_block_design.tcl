create_project block_design ./block_design -part xc7a100tcsg324-1

create_bd_design "block_design"
update_compile_order -fileset sources_1
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0
endgroup
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200.000} CONFIG.USE_RESET {false} CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.000} CONFIG.CLKOUT1_JITTER {114.829}] [get_bd_cells clk_wiz_0]
startgroup
make_bd_pins_external  [get_bd_pins clk_wiz_0/clk_out1]
endgroup
set_property name clk_out [get_bd_ports clk_out1_0]
startgroup
make_bd_pins_external  [get_bd_pins clk_wiz_0/clk_in1]
endgroup
set_property name clk_in [get_bd_ports clk_in1_0]
startgroup
make_bd_pins_external  [get_bd_pins clk_wiz_0/locked]
endgroup
set_property name locked [get_bd_ports locked_0]

make_wrapper -files [get_files ./block_design/block_design.srcs/sources_1/bd/block_design/block_design.bd] -top
add_files -norecurse ./block_design/block_design.gen/sources_1/bd/block_design/hdl/block_design_wrapper.v

