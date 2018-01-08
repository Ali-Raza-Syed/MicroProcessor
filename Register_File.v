`timescale 1ns / 1ps
module Register_File(in_read_reg_1_add, in_read_reg_2_add, in_write_reg_add, in_write_reg_val, in_write_en,
							in_clk, in_rst,
							out_reg_1_val, out_reg_2_val);
input [7:0] in_read_reg_1_add, in_read_reg_2_add, in_write_reg_add;
input [15:0] in_write_reg_val;
input in_write_en, in_clk, in_rst;
output [15:0] out_reg_1_val, out_reg_2_val;

reg [15:0] reg_file [255:0];

assign out_reg_1_val = reg_file[in_read_reg_1_add];
assign out_reg_2_val = reg_file[in_read_reg_2_add];

integer i;
always@(posedge in_clk, negedge in_rst)
begin
	if(!in_rst)
	begin
		for(i = 0; i < 255; i = i + 1)
		begin
			reg_file[i] <= 0;
		end
		//remove later
		reg_file[0] <= 1;
		reg_file[1] <= 2;
	end
	else
	begin
		//check whether data needs to be written
		if(in_write_en == 1)
		begin
			reg_file[in_write_reg_add] <= in_write_reg_val;
		end
	end
end


endmodule
