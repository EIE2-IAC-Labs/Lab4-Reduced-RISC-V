module RISC #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,
    parameter IMMO_WIDTH = 32,
    parameter INSTR_LEN = 32
) (
    input logic clk,
    input logic rst,
    output logic [31:0] a0
);


// PC begin
wire PCsrc;
wire [IMMO_WIDTH-1:0] ImmOp;
wire [ADDR_WIDTH-1:0] PC;

pc_top pc_top(
.clk(clk),
.rst(rst),
.PCsrc(PCsrc),
.ImmOp(ImmOp),
.PC(PC)
);

// PC end

// Instr_mem begin
wire [INSTR_LEN-1:0] RD;


instr_mem instr_mem(
.A(PC[7:0]),
.RD(RD)
);

// Instr_mem end

//control_unit start
logic RegWrite;
logic [2:0] ALUctrl;
logic ALUsrc;
logic [1:0] Immsrc;
logic PCsrc;

control_unit control_unit(
.instr(RD),
.EQ(EQ),
.RegWrite(RegWrite),
.ALUctrl(ALUctrl),
.ALUsrc(ALUsrc),
.Immsrc(Immsrc),
.PCsrc(PCsrc)
);
//control_unit end

//reg_file start
logic [4:0] AD1 = RD[19:15];
logic [4:0] AD2 = RD[24:20];
logic [4:0] AD3 = RD[11:7];
logic [31:0] RD1;
logic [31:0] RD2;

reg_file reg_file(
.clk(clk),
.AD1(AD1),
.AD2(AD2),
.AD3(AD3),
.WE3(RegWrite),
.WD3(ALUout),
.RD1(RD1),
.RD2(RD2),
.a0(a0)
);

//reg_file end




//ALU begin
logic [31:0] ALUout;
logic EQ;

alu ALU(
.ALUctrl(ALUctrl),
.ALUsrc(ALUsrc),
.regOp2(RD2),
.ImmOp(ImmOp),
.ALUop1(RD1),
.ALUout(ALUout),
.EQ(EQ)
);
//ALU end

//sign_extend begin
sign_extend sign_extend(
.Immsrc(Immsrc),
.in(RD),
.out(ImmOp)
);
//sign_extend end
endmodule






