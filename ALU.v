`timescale 1ns / 1ps
module ALU(in_operand_1, in_operand_2, in_alu_op_sel, out_result);
input[15:0] in_operand_1, in_operand_2;
input [1:0]in_alu_op_sel;
output reg[15:0] out_result;

always@(*)
begin
	case(in_alu_op_sel)
	0: begin
		out_result = in_operand_1 + in_operand_2;
	end
	1: begin
		out_result = in_operand_1 - in_operand_2;
	end
	2: begin
		out_result = in_operand_1 & in_operand_2;
	end
	3: begin
		out_result = in_operand_1 | in_operand_2;
	end
	endcase
end

endmodule
