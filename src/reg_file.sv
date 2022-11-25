module reg_file (
  input logic clk,
  input logic [4:0] AD1,
  input logic [4:0] AD2,
  input logic [4:0] AD3,
  input logic WE3,
  input logic [31:0] WD3,
  output logic [31:0] RD1,
  output logic [31:0] RD2,
  output logic [31:0] a0
);

// note: name variables with correct name
// note: 32 x 32-bit reg file: address 5 bits
logic [31:0] reg_data [2**4:0]; 

// note: use correct indentation for block
// note: not needed
// always_comb
//   AD1 = instr[19:15];
//   AD2 = instr[24:20];
//   AD3 = instr[11:7];
//   x[0] = 32'b0

// note: no 'assign' keyword needed in 'always_com'
always_comb begin
  RD1 = reg_data[AD1];
  RD2 = reg_data[AD2];
  a0 = reg_data[10];
end
// note: condense to one line if only one line of code
always_ff @ (posedge clk)
  if (WE3) reg_data[AD3] <= WD3; 

endmodule
