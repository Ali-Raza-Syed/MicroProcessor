`timescale 1ns / 1ps
module Mux_1(in_add_instr, in_add_reg, in_sel_2, out_add);
input[7:0] in_add_instr, in_add_reg;
input in_sel_2;
output reg[7:0] out_add;

always@(*)
begin
	case(in_sel_2)
	0:begin
		out_add = in_add_instr;
	end
	1:begin
		out_add = in_add_reg;
	end
	endcase
end

endmodule
