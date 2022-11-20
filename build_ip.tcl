create_project cores ./cores -part xc7a100tcsg324-1

########################################
# Clocking Wizard
########################################
create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name clocking_wizard
set_property -dict [list CONFIG.Component_Name {clocking_wizard} CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {25} CONFIG.USE_RESET {false} CONFIG.MMCM_CLKFBOUT_MULT_F {9.125} CONFIG.MMCM_CLKOUT0_DIVIDE_F {36.500} CONFIG.CLKOUT1_JITTER {181.828} CONFIG.CLKOUT1_PHASE_ERROR {104.359}] [get_ips clocking_wizard]
generate_target {instantiation_template} [get_files ./cores/cores.srcs/sources_1/ip/clocking_wizard/clocking_wizard.xci]
generate_target all [get_files  ./cores/cores.srcs/sources_1/ip/clocking_wizard/clocking_wizard.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./cores/cores.srcs/sources_1/ip/clocking_wizard/clocking_wizard.xci]
launch_runs clocking_wizard_synth_1 -jobs 4

########################################
# JTAG to AXI Master
########################################
create_ip -name jtag_axi -vendor xilinx.com -library ip -version 1.2 -module_name jtag_axi_master
set_property -dict [list CONFIG.PROTOCOL {2} CONFIG.Component_Name {jtag_axi_master}] [get_ips jtag_axi_master]
generate_target {instantiation_template} [get_files ./cores/cores.srcs/sources_1/ip/jtag_axi_master/jtag_axi_master.xci]
generate_target all [get_files  ./cores/cores.srcs/sources_1/ip/jtag_axi_master/jtag_axi_master.xci]
create_ip_run [get_files -of_objects [get_fileset sources_1] ./cores/cores.srcs/sources_1/ip/jtag_axi_master/jtag_axi_master.xci]
launch_runs jtag_axi_master_synth_1 -jobs 4

