#Reset the JTAG-to-AXI Master Debug Core
reset_hw_axi [get_hw_axis hw_axi_1]

#Create and run the read and write transactions
create_hw_axi_txn rd_txn_lite_2 [get_hw_axis hw_axi_1] -address 00000004 -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_2]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_2]
create_hw_axi_txn rd_txn_lite_3 [get_hw_axis hw_axi_1] -address 00000008 -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_3]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_3]
create_hw_axi_txn rd_txn_lite_4 [get_hw_axis hw_axi_1] -address 0000000C -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_4]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_4]
create_hw_axi_txn rd_txn_lite_5 [get_hw_axis hw_axi_1] -address 00000010 -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_5]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_5]
create_hw_axi_txn rd_txn_lite_6 [get_hw_axis hw_axi_1] -address 00000014 -type read
run_hw_axi [get_hw_axi_txns rd_txn_lite_6]
report_hw_axi_txn [get_hw_axi_txns rd_txn_lite_6]
