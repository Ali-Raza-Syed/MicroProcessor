`timescale 1ns / 1ps
module Processor(in_clk, in_rst);
input in_clk, in_rst;

wire[28:0] INSTRUCTION_REG_out_current_instruction;
wire[4:0] CU_in_op_code;
assign CU_in_op_code = INSTRUCTION_REG_out_current_instruction[28:24];
wire CU_out_reg_file_wr_en, CU_out_alu_operand_1_sel, CU_out_PC_MUX_sel_1;
wire [1:0]CU_out_alu_op_sel;
Control_Unit CU(CU_in_op_code, CU_out_reg_file_wr_en, CU_out_alu_op_sel, CU_out_alu_operand_2_sel,
						CU_out_PC_MUX_sel_1);

wire[7:0] PC_REG_in_add;
wire[7:0] PC_REG_add_out;
assign PC_REG_in_add = PC_REG_add_out + 1;
Register #(8) PC_REG(PC_REG_in_add, in_clk, in_rst, PC_REG_add_out);

wire[7:0] PC_MUX_in_jump_add;
assign PC_MUX_in_jump_add = INSTRUCTION_REG_out_current_instruction[23:16];
wire[7:0] PC_MUX_out_PC_add;
PC_Mux PC_MUX(PC_REG_add_out, PC_MUX_in_jump_add, CU_out_PC_MUX_sel_1, PC_MUX_out_PC_add);

wire[28:0] PM_out_instruction;
Program_Memory PM(PC_MUX_out_PC_add, PM_out_instruction);

Register #(29) INSTRUCTION_REG(PM_out_instruction, in_clk, in_rst, INSTRUCTION_REG_out_current_instruction);

wire REG_FILE_WR_EN_REG_out_reg_file_en;
Register #(1) REG_FILE_WR_EN_REG(CU_out_reg_file_wr_en, in_clk, in_rst, REG_FILE_WR_EN_REG_out_reg_file_en);

wire[15:0] ALU_OBJ_out_result;
wire[15:0] REG_FILE_WRITE_VAL_REG_out;
Register #(16) REG_FILE_WRITE_VAL_REG(ALU_OBJ_out_result, in_clk, in_rst, REG_FILE_WRITE_VAL_REG_out);

wire[7:0] REG_FILE_WRITE_ADD_REG_in = INSTRUCTION_REG_out_current_instruction[23:16];
wire[7:0] REG_FILE_WRITE_ADD_REG_out;
Register #(8) REG_FILE_WRITE_ADD_REG(REG_FILE_WRITE_ADD_REG_in, in_clk, in_rst, REG_FILE_WRITE_ADD_REG_out);

wire[7:0] REGISTER_FILE_in_read_reg_1_add, REGISTER_FILE_in_read_reg_2_add;
assign REGISTER_FILE_in_read_reg_1_add = INSTRUCTION_REG_out_current_instruction[15:8];
assign REGISTER_FILE_in_read_reg_2_add = INSTRUCTION_REG_out_current_instruction[7:0];

wire[15:0] REGISTER_FILE_out_reg_1_val, REGISTER_FILE_out_reg_2_val;
Register_File REGISTER_FILE(REGISTER_FILE_in_read_reg_1_add, REGISTER_FILE_in_read_reg_2_add, 
									INSTRUCTION_REG_out_current_instruction[23:16],
									ALU_OBJ_out_result, CU_out_reg_file_wr_en,
									in_clk, in_rst,
									REGISTER_FILE_out_reg_1_val, REGISTER_FILE_out_reg_2_val);

wire[15:0] ALU_OPERAND_2_MUX_in_immediate_val = {8'd0, INSTRUCTION_REG_out_current_instruction[7:0]};
wire[15:0] ALU_OPERAND_2_MUX_out;
ALU_Operand_2_Mux ALU_OPERAND_2_MUX(ALU_OPERAND_2_MUX_in_immediate_val, REGISTER_FILE_out_reg_2_val,
									CU_out_alu_operand_2_sel, ALU_OPERAND_2_MUX_out);
ALU ALU_OBJ(REGISTER_FILE_out_reg_1_val, ALU_OPERAND_2_MUX_out, CU_out_alu_op_sel, ALU_OBJ_out_result);
									

endmodule
