module pc_reg #(
  parameter ADDR_WIDTH = 32,
  parameter DATA_WIDTH = 32
)(
  input logic clk,
  input logic rst,
  input logic [ADDR_WIDTH-1:0] next_pc,
  output logic [ADDR_WIDTH-1:0] pc
);

always_ff @(posedge clk) begin
  if (rst) pc <= {ADDR_WIDTH{1'b0}};
  pc <= next_pc;
end

endmodule
