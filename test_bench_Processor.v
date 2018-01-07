`timescale 1ns / 1ps

module test_bench_Processor;

	// Inputs
	reg in_clk;
	reg in_rst;

	// Instantiate the Unit Under Test (UUT)
	Processor uut (
		.in_clk(in_clk), 
		.in_rst(in_rst)
	);

	initial begin
		// Initialize Inputs
		in_clk = 0;
		in_rst = 0;
		#5 in_rst = 1;
	end
	
	always
	#5 in_clk = ~in_clk;
      
endmodule

