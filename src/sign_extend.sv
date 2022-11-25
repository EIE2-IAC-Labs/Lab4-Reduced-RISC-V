module sign_extend #(
  parameter IN_LEN = 32,
  parameter OUT_LEN = 32
)(
  // note: don't use same variable name as keywords
  input logic [1:0] Immsrc,
  input logic [IN_LEN-1:0] in,
  output logic [OUT_LEN-1:0] out
);

// note: missing endcase
// note: add space in between commas
always_comb
  case (Immsrc)
    2'b00: out = {{20{in[31]}}, in[31:20]};
    2'b01: out = {{20{in[31]}}, in[31], in[7], in[30:25], in[11:8],1'b0};
    default: out = 32'b0;
  endcase

endmodule
