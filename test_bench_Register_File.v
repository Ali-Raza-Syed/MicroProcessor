`timescale 1ns / 1ps
module test_bench_Register_File;

	// Inputs
	reg [7:0] in_read_reg_1_add;
	reg [7:0] in_read_reg_2_add;
	reg [7:0] in_write_reg_add;
	reg [15:0] in_write_reg_val;
	reg in_write_en;
	reg in_clk;
	reg in_rst;

	// Outputs
	wire [15:0] out_reg_1_val;
	wire [15:0] out_reg_2_val;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.in_read_reg_1_add(in_read_reg_1_add), 
		.in_read_reg_2_add(in_read_reg_2_add), 
		.in_write_reg_add(in_write_reg_add), 
		.in_write_reg_val(in_write_reg_val), 
		.in_write_en(in_write_en), 
		.in_clk(in_clk), 
		.in_rst(in_rst), 
		.out_reg_1_val(out_reg_1_val), 
		.out_reg_2_val(out_reg_2_val)
	);

	initial begin
		// Initialize Inputs
		in_read_reg_1_add = 0;
		in_read_reg_2_add = 0;
		in_write_reg_add = 0;
		in_write_reg_val = 0;
		in_write_en = 0;
		in_clk = 0;
		in_rst = 0;
		#5 in_rst = 1;
		// Wait 100 ns for global reset to finish
		
		in_write_reg_add = 0; in_write_en = 1; in_write_reg_val = 10;
		#10 in_write_reg_add = 1; in_write_en = 1; in_write_reg_val = 11;
		#10 in_write_reg_add = 2; in_write_en = 1; in_write_reg_val = 12;
      #10 in_read_reg_1_add = 0; in_read_reg_2_add = 1; in_write_en = 0;
		#10 in_read_reg_1_add = 1; in_read_reg_2_add = 2; in_write_en = 0;
		// Add stimulus here

	end
	
	always
	#5 in_clk = ~in_clk;
      
endmodule

