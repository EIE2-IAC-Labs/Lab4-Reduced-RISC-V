module control_unit #(
  parameter INSTR_LEN = 32
)(
  input logic [INSTR_LEN-1:0] instr,
  input logic EQ,
  output logic RegWrite,
  output logic [2:0] ALUctrl,
  output logic ALUsrc,
  output logic [1:0] Immsrc,
  output logic PCsrc
);

// note: unify indentation scheme
// note: add begin and end for multiline statements
always_comb begin
  case(instr[6:0])
    7'b0010011: begin // addi
      case(instr[14:12])
        3'b000: begin
          ALUctrl = 3'b000;
          ALUsrc = 1;
        end
        default: begin
          ALUctrl = 3'b000;
          ALUsrc = 0;
        end
      endcase
      RegWrite = 1;
      PCsrc = 0;
      Immsrc = 2'b00;
    end

    7'b1100011: begin // bne & beq
      case(instr[14:12])
        3'b000: 
          PCsrc = EQ;
        3'b001: 
          PCsrc = ~EQ;
        default: 
          PCsrc = 0;
      endcase
      RegWrite = 0;
      Immsrc = 2'b01;
      ALUctrl = 3'b001; 
      ALUsrc = 0;
    end

    default: begin
      RegWrite = 0;
      ALUctrl = 2'b00;
      ALUsrc = 0;
      Immsrc = 0;
      PCsrc = 0;
    end
  endcase
end

// note: remove unused code

endmodule
