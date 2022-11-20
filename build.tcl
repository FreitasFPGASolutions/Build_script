create_project Build_script ./build -part xc7a100tcsg324-1

add_files -norecurse ./axi4lite_interface.sv
add_files -norecurse ./register_interface_v1_0_S00_AXI.v
add_files -norecurse ./leds.sv
add_files -norecurse ./cores/cores.srcs/sources_1/ip/clocking_wizard/clocking_wizard.xci
add_files -norecurse ./cores/cores.srcs/sources_1/ip/jtag_axi_master/jtag_axi_master.xci
add_files -norecurse ./block_design/block_design.gen/sources_1/bd/block_design/hdl/block_design_wrapper.v
add_files -norecurse ./block_design/block_design.srcs/sources_1/bd/block_design/block_design.bd
update_compile_order -fileset sources_1
add_files -fileset constrs_1 -norecurse ./leds.xdc

set date [clock format [clock seconds] -format {%m%d%Y}]
set_property generic "BUILD_DATE_i=32'h$date" [current_fileset]
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]

launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
puts "Implementation done!"

open_run impl_1
report_timing_summary
report_cdc -details -file ./cdc_report.txt

