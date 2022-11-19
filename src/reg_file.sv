module reg_file (
    input logic clk,
    input logic [31:0] instr,
    input logic WE3,
    input logic [31:0] WD3,
    output logic [31:1] RD1,
    output logic [31:0] RD2,
    output logic [31:0] a0
);

    logic [4:0] AD1;
    logic [4:0] AD2;
    logic [4:0] AD3;
    logic [31:0] x[31:0];

    always_comb
        assign AD1 = instr[19:15];
        assign AD2 = instr[24:20];
        assign AD3 = instr[11:7];
        assign x[0] = 32'b0

    always_comb
        assign RD1 = x[AD1];
        assign RD2 = x[AD2];
        assign a0 = x[10];

    always_ff @ (posedge clk)
        if (WE3)
            x[AD3] <= WD3;
        

endmodule