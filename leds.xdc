##Clock signal
set_property PACKAGE_PIN E3 [get_ports CLK_100_i]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_100_i]
create_clock -period 10 -name CLK_100 [get_ports CLK_100_i]

##Over temperature shutdown
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]

##LEDs
set_property PACKAGE_PIN H5 [get_ports LED4_o]
set_property IOSTANDARD LVCMOS33 [get_ports LED4_o]
set_property PACKAGE_PIN J5 [get_ports LED5_o]
set_property IOSTANDARD LVCMOS33 [get_ports LED5_o]
set_property PACKAGE_PIN T9 [get_ports LED6_o]
set_property IOSTANDARD LVCMOS33 [get_ports LED6_o]
set_property PACKAGE_PIN T10 [get_ports LED7_o]
set_property IOSTANDARD LVCMOS33 [get_ports LED7_o]
