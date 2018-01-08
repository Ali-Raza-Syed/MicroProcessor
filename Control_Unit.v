`timescale 1ns / 1ps
module Control_Unit(in_op_code, out_reg_file_wr_en, out_alu_op_sel, out_alu_operand_1_sel,
							out_pc_mux_sel_1);
input [4:0] in_op_code;
output reg out_reg_file_wr_en, out_alu_operand_1_sel, out_pc_mux_sel_1;
output reg [1:0]out_alu_op_sel;

always@(*)
begin

case(in_op_code)
0:
begin
	out_reg_file_wr_en = 0;
	out_alu_op_sel = 0;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 0;
end
1:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 0;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 0;
end
2:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 1;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 0;
end
3:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 2;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 0;
end
4:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 3;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 0;
end
5:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 0;
	out_alu_operand_1_sel = 1;
	out_pc_mux_sel_1 = 0;
end
6:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 1;
	out_alu_operand_1_sel = 1;
	out_pc_mux_sel_1 = 0;
end
7:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 2;
	out_alu_operand_1_sel = 1;
	out_pc_mux_sel_1 = 0;
end
8:
begin
	out_reg_file_wr_en = 1;
	out_alu_op_sel = 3;
	out_alu_operand_1_sel = 1;
	out_pc_mux_sel_1 = 0;
end
9:
begin
	out_reg_file_wr_en = 0;
	out_alu_op_sel = 0;
	out_alu_operand_1_sel = 0;
	out_pc_mux_sel_1 = 1;
end
endcase
end

endmodule

//0 = no op
//1 = add
//2 = sub
//3 = and
//4 = or
//5 = addi
//6 = subi
//7 = andi
//8 = ori
//9 = jump