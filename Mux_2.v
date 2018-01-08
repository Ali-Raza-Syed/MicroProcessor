`timescale 1ns / 1ps
module Mux_2(in_add_instr, in_add_jump_reg_add, in_sel_3, out_add);
input[7:0] in_add_instr, in_add_jump_reg_add;
input in_sel_3;
output reg[7:0] out_add;

always@(*)
begin
	case(in_sel_3)
	0:begin
		out_add = in_add_instr;
	end
	1:begin
		out_add = in_add_jump_reg_add;
	end
	endcase
end

endmodule
