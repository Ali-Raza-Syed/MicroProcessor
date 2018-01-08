`timescale 1ns / 1ps
module PC_Mux(in_pc_plus_one, in_jump_add, in_sel_1, out_add);
input[7:0] in_pc_plus_one, in_jump_add;
input in_sel_1;
output reg[7:0] out_add;

always@(*)
begin
	case(in_sel_1)
	0: begin
		out_add = in_pc_plus_one;
		
	end
	1: begin
		out_add = in_jump_add;
	end
	endcase
end

endmodule
