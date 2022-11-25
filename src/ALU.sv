module ALU (
    input logic [2:0] ALUctrl,
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
        if (ALUout == 0) EQ = 1;
        else EQ = 0;

    always_comb
        case (ALUctrl)
            3'b000: begin
                ALUout = ALUop1 + ALUop2;
            end
            3'b001: begin
                ALUout = ALUop1 - ALUop2;
            end 
            default: begin
                assign ALUout = 32'b0;
                if (ALUop1 == ALUop2)
                    assign EQ = 1'b1;
                else
                    assign EQ = 1'b0;
            end 
        endcase

endmodule