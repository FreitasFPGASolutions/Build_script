#Reset the JTAG-to-AXI Master Debug Core
reset_hw_axi [get_hw_axis hw_axi_1]

#Create and run the read and write transactions
create_hw_axi_txn rd_txn_lite_1 [get_hw_axis hw_axi_1] -address 00000000 -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_1]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_1]

