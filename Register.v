`timescale 1ns / 1ps
module Register(in_input, in_clk, in_rst, out_output);
parameter reg_size = 1;

input [reg_size - 1:0] in_input;
input in_clk, in_rst;
output reg[reg_size - 1:0] out_output;

always@(posedge in_clk, negedge in_rst)
begin
	if(!in_rst)
	begin
		out_output <= 0;
	end
	else
	begin
		out_output <= in_input;
	end
end

endmodule
