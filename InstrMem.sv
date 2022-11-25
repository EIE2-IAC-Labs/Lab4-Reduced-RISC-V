module InstrMem #(
    parameter instr_length = 32,
              addr_length = 32,
)(
    input logic [addr_length-1:0] address,
    output logic [instr_length-1:0] instruction,
);

logic [instr_length-1:0] rom_instrmem [2**addr_length-1:0];

assign instruction = rom_instrmem [address];

endmodule
