module instr_mem #(
  // note: use correct naming convention for parameters
  parameter INSTR_LEN = 32,
  parameter ADDR_LEN = 8
)(
  // note: use correct name for component externals
  input logic [ADDR_LEN-1:0] A,
  output logic [INSTR_LEN-1:0] RD
);

logic [INSTR_LEN-1:0] instr_data [2**ADDR_LEN-1:0];

initial begin
  $display("[DUT] Load instr_mem from instr.mem file.");
  $readmemh("control_unit/instr.mem", instr_data);
end

// note: right shift A by 2 digits for byte addressing
assign RD = instr_data[{2'b0, A[ADDR_LEN-1:2]}];

endmodule
