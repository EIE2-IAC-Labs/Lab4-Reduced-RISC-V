module pc_top #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32,
  parameter IMMO_WIDTH = 32
)(
  input logic clk,
  input logic rst,
  input logic PCsrc,
  input logic [IMMO_WIDTH-1:0] ImmOp,
  output logic [ADDR_WIDTH-1:0] PC
);

logic [ADDR_WIDTH-1:0] next_pc;

assign next_pc = (PCsrc ? {PC + ImmOp} : {PC + 32'd4});

pc_reg pr(
  .clk(clk),
  .rst(rst),
  .next_pc(next_pc),
  .pc(PC)
);
  
endmodule
