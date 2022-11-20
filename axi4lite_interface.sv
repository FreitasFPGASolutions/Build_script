interface axi4lite_interface
#(parameter integer DATA_WIDTH = 32, parameter integer ADDR_WIDTH = 32);
  logic [ADDR_WIDTH-1:0] axi_araddr;
  logic axi_arready;
  logic axi_arvalid;
  logic [ADDR_WIDTH-1:0] axi_awaddr;
  logic axi_awready;
  logic axi_awvalid;
  logic axi_bready;
  logic [1:0] axi_bresp;
  logic axi_bvalid;
  logic [DATA_WIDTH-1:0] axi_rdata;
  logic axi_rready;
  logic [1:0] axi_rresp;
  logic axi_rvalid;
  logic [DATA_WIDTH-1:0] axi_wdata;
  logic axi_wready;
  logic [(DATA_WIDTH/8)-1:0] axi_wstrb;
  logic axi_wvalid;
endinterface
