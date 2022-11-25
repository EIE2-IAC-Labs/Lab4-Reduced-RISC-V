module control_unit_top #(
    parameter INSTR_LEN = 32,
    parameter ADDR_LEN = 8
) (
    input logic [ADDR_LEN-1:0] A,
    input logic EQ,
    output logic RegWrite,
    output logic [2:0] ALUctrl,
    output logic ALUsrc,
    output logic [1:0] Immsrc,
    output logic PCsrc
);

logic [INSTR_LEN-1:0] RD;

instr_mem instr_mem(
.A(A),
.RD(RD)
);

control_unit control_unit(
.instr(RD),
.EQ(EQ),
.RegWrite(RegWrite),
.ALUctrl(ALUctrl),
.ALUsrc(ALUsrc),
.Immsrc(Immsrc),
.PCsrc(PCsrc)
);   
endmodule
