module leds #
(
  parameter logic [31:0] BUILD_DATE_i = 32'h000000BD,
  parameter logic [159:0] COMMIT_i = 159'h11111111_22222222_33333333_44444444_55555555
)
(
  input CLK_100_i,
  output LED4_o,
  output LED5_o,
  output LED6_o,
  output LED7_o
);

//Block Design
logic bd_mmcm_locked;
logic clk_200;

block_design_wrapper bd (
  .clk_in  (CLK_100_i),
  .clk_out (clk_200),
  .locked  (bd_mmcm_locked)
);

//MMCM
logic mmcm_locked;
logic clk_25;
logic aresetn = 0;
logic [7:0] aresetn_count = 0;

clocking_wizard mmcm (
  .clk_out1 (clk_25),
  .locked   (mmcm_locked),
  .clk_in1  (CLK_100_i)
);

always @ (posedge CLK_100_i)
begin
  aresetn_count <= aresetn_count + 1;
  if (aresetn_count == 8'h20)
    begin
      aresetn <= 1;
    end
end

//JTAG
axi4lite_interface bus ();

jtag_axi_master jtag (
  .aclk          (CLK_100_i),
  .aresetn       (aresetn),
  .m_axi_awaddr  (bus.axi_awaddr),
  .m_axi_awprot  (),
  .m_axi_awvalid (bus.axi_awvalid),
  .m_axi_awready (bus.axi_awready),
  .m_axi_wdata   (bus.axi_wdata),
  .m_axi_wstrb   (bus.axi_wstrb),
  .m_axi_wvalid  (bus.axi_wvalid),
  .m_axi_wready  (bus.axi_wready),
  .m_axi_bresp   (bus.axi_bresp),
  .m_axi_bvalid  (bus.axi_bvalid),
  .m_axi_bready  (bus.axi_bready),
  .m_axi_araddr  (bus.axi_araddr),
  .m_axi_arprot  (),
  .m_axi_arvalid (bus.axi_arvalid),
  .m_axi_arready (bus.axi_arready),
  .m_axi_rdata   (bus.axi_rdata),
  .m_axi_rresp   (bus.axi_rresp),
  .m_axi_rvalid  (bus.axi_rvalid),
  .m_axi_rready  (bus.axi_rready)
);

register_interface_v1_0_S00_AXI regif (
  .S_AXI_ACLK    (CLK_100_i),
  .S_AXI_ARESETN (aresetn),
  .S_AXI_AWADDR  (bus.axi_awaddr),
  .S_AXI_AWPROT  (3'b000),
  .S_AXI_AWVALID (bus.axi_awvalid),
  .S_AXI_AWREADY (bus.axi_awready),
  .S_AXI_WDATA   (bus.axi_wdata),
  .S_AXI_WSTRB   (bus.axi_wstrb),
  .S_AXI_WVALID  (bus.axi_wvalid),
  .S_AXI_WREADY  (bus.axi_wready),
  .S_AXI_BRESP   (bus.axi_bresp),
  .S_AXI_BVALID  (bus.axi_bvalid),
  .S_AXI_BREADY  (bus.axi_bready),
  .S_AXI_ARADDR  (bus.axi_araddr),
  .S_AXI_ARPROT  (3'b000),
  .S_AXI_ARVALID (bus.axi_arvalid),
  .S_AXI_ARREADY (bus.axi_arready),
  .S_AXI_RDATA   (bus.axi_rdata),
  .S_AXI_RRESP   (bus.axi_rresp),
  .S_AXI_RVALID  (bus.axi_rvalid),
  .S_AXI_RREADY  (bus.axi_rready),
  .BUILD_DATE_i  (BUILD_DATE_i),
  .COMMIT_i      (COMMIT_i)
);

//LEDs
logic [27:0] clk_200_count = 0;
logic clk_200_led = 0;
logic [27:0] clk_100_count = 0;
logic clk_100_led = 0;
logic [27:0] clk_25_count = 0;
logic clk_25_led = 0;

assign LED4_o = clk_100_led;
assign LED5_o = clk_100_led;
assign LED6_o = clk_25_led;
assign LED7_o = clk_200_led;

always @ (posedge clk_200)
begin
  clk_200_count <= clk_200_count + 1;
  if (clk_200_count == 28'hBEBC200)
    begin
      clk_200_led <= ~clk_200_led;
      clk_200_count <= 0;
    end
end

always @ (posedge CLK_100_i)
begin
  clk_100_count <= clk_100_count + 1;
  if (clk_100_count == 28'h5F5E100)
    begin
      clk_100_led <= ~clk_100_led;
      clk_100_count <= 0;
    end
end

always @ (posedge clk_25)
begin
  clk_25_count <= clk_25_count + 1;
  if (clk_25_count == 28'h17D7840)
    begin
      clk_25_led <= ~clk_25_led;
      clk_25_count <= 0;
    end
end

endmodule
