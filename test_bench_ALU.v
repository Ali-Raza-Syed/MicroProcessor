`timescale 1ns / 1ps

module test_bench_ALU;

	// Inputs
	reg [15:0]in_operand_1;
	reg [15:0] in_operand_2;

	// Outputs
	wire [15:0] out_result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.in_operand_1(in_operand_1), 
		.in_operand_2(in_operand_2), 
		.out_result(out_result)
	);

	initial begin
		// Initialize Inputs
		in_operand_1 = 0;
		in_operand_2 = 0;
		#10
		in_operand_1 = 1; in_operand_2 = 2;
		#10
		in_operand_1 = 5; in_operand_2 = 10;
		#10
		in_operand_1 = 40; in_operand_2 = 20;

	end
      
endmodule

