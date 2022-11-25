module alu (
  input logic ALUsrc,
  input logic [2:0] ALUctrl,
  input logic [31:0] ImmOp,
  input logic [31:0] ALUop1,
  input logic [31:0] regOp2,
  output logic EQ,
  output logic [31:0] ALUout // note: 31:1 -> 31:0
);

// note: use correct indentation
logic [31:0] ALUop2;

always_comb
  if (ALUsrc) ALUop2 = ImmOp;
  else ALUop2 = regOp2;
    
// note: unify number format
always_comb
  if (ALUout == 0) EQ = 1'b1;
  else EQ = 1'b0;

always_comb
  case (ALUctrl)
    3'b000: 
      ALUout = ALUop1 + ALUop2;
    3'b001:
      ALUout = ALUop1 - ALUop2;
    default: begin
      ALUout = 32'b0;
      EQ = 1'b0; // note: set everything to 0 at default
    end
  endcase

endmodule
