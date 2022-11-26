module ALUtop #(
    parameter DATA_WIDTH = 32
)(
    input wire clk,
    input wire ALUsrc,
    input wire [2:0] ALUctrl,
    input wire [DATA_WIDTH-1:0] Instr,
    input wire RegWrite,
    input wire [DATA_WIDTH-1:0] ImmOp,
    output wire EQ,
    output wire [DATA_WIDTH-1:0] a0
);

wire [DATA_WIDTH-1:0] ALUout;
wire [DATA_WIDTH-1:0] ALUop1;
wire [DATA_WIDTH-1:0] regOp2;

wire [4:0] AD1 = Instr[19:15];
wire [4:0] AD2 = Instr[24:20];
wire [4:0] AD3 = Instr[11:7];

reg_file RegFile(
.clk(clk),
.AD1(AD1),
.AD2(AD2),
.AD3(AD3),
.WE3(RegWrite),
.WD3(ALUout),
.RD1(ALUop1),
.RD2(regOp2),
.a0(a0)
);


alu ALU(
.ALUsrc(ALUsrc),
.ALUctrl(ALUctrl),
.ImmOp(ImmOp),
.ALUop1(ALUop1),
.regOp2(regOp2),
.ALUout(ALUout),
.EQ(EQ)
);
endmodule