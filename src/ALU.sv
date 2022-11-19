module ALU (
    input logic ALUctrl,
    input logic ALUsrc,
    input logic [31:0] regOp2,
    input logic [31:0] ImmOp,
    input logic [31:0] ALUop1,
    output logic [31:1] ALUout,
    output logic EQ
);

    logic [31:0] ALUop2,

    always_comb
        if (ALUsrc)
            ALUop2 = ImmOp;
        else
            ALUop2 = regOp2;

    always_comb
        if (ALUctrl) begin
            assign ALUout = ALUop1 + ALUop2;
            assign EQ = 1'b0;
        end
        else begin
            assign ALUout = 32'b0;
            if (ALUop1 == ALUop2)
                assign EQ = 1'b1;
            else
                assign EQ = 1'b0;
        end

        
            


endmodule