`timescale 1ns / 1ps
module ALU_Operand_2_Mux(in_immediate_operand_2, in_reg_operand_2, in_sel_operand_2,
									out_operand_2);
input [15:0] in_immediate_operand_2, in_reg_operand_2;
input in_sel_operand_2;
output reg[15:0] out_operand_2;

always@(*)
begin
	case(in_sel_operand_2)
	0: begin
		out_operand_2 = in_reg_operand_2;
		
	end
	1: begin
		out_operand_2 = in_immediate_operand_2;
	end
	endcase
end

endmodule
