module ControlUnit #(
    parameter instr_length = 32,
              //
)(
    input logic [instr_length-1:0] instr,
    input logic EQ,
    output logic RegWrite,
    output logic [2:0] ALUctrl, //choose alu operations
    output logic ALUsrc,//choose imm/register operand
    output logic [1:0] Immsrc,//choose signed extension of imm
    output logic PCsrc//choose next state of pc counter
);

always_comb begin
    case(instr[6:0])
    7'b0010011: case(instr[14:12]) //addi
                3'b000: ALUctrl = 3'b000;
                        ALUsrc = 1;
                default: ALUctrl = 3'b000;
                         ALUsrc = 0;
                endcase
                RegWrite = 1;
                PCsrc = 0;
                Immsrc = 2'b00;

    7'b1100011: case(instr[14:12]) //bne&beq
                3'b000: PCsrc = EQ;
                3'b001: PCsrc = ~EQ;
                default: PCsrc = 0;
                endcase
                RegWrite = 0;
                Immsrc = 2'b01;
                ALUctrl = 3'b001; 
                ALUsrc = 0;

    default: RegWrite = 0;
             ALUctrl = 2'b00;
             ALUsrc = 0;
             Immsrc = 0;
             PCsrc = 0;
    endcase
end

/*always_comb begin
    if(instr[6:0] == 7'b0010011){//alu instructions
        if(instr[14:12] == 3'b0){
            ALUctrl = 3'b0;//depending on the design of ALU
            ALUsrc = 1;
        }
        RegWrite = 1;//enable for all alu instructions
        PCsrc = 0;//do not need to branch in alu instrucitons
        Immsrc = instr[31];
    }

    else if(instr[6:0] == 7'b1100011){//branch instructions
        if(instr[14:12] == 3'b0){//beq
            PCsrc == EQ;
        }
        else if(instr[14:12] == 3'b001){//bne
            PCsrc == ~EQ;
        }
        RegWrite = 0;
        Immsrc = instr[31];
        ALUctrl = 3'b0; 
        ALUsrc = 0;
    }
end*/


endmodule
