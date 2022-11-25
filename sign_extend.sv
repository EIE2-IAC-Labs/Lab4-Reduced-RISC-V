module Signextend #(
    parameter in_length = 32;
              out_length = 32;
)(
    input logic [1:0]Immsrc;
    input logic [in_length-1:0] input,
    output logic [out_length-1:0] output
);

always_comb begin
    case(Immsrc)
    2'b00: output = {20{input[31]},input[31:20]};
    2'b01: output = {20{input[31]},input[31],input[7],input[30:25],input[11:8]};
    default: ouput = 32'b0;
end

endmodule
