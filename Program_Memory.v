
//outputs:
//out_instruction: instruction

module Program_Memory(in_add, out_instruction);
  //defining ports
  input[7:0] in_add;
  output[29 - 1 : 0] out_instruction;
  
  //defining program memory
  reg[29 - 1:0] p_mem[255:0];
  
  assign out_instruction = p_mem[in_add];
  
  //putting in instruction ourselves
  initial
  begin
	 p_mem[0] = 0;
	 //addi R5, R4, 1
	 p_mem[1] = 29'b00101_00000101_00000100_00000001;
	 //add R2, R5, R1
    p_mem[2] = 29'b00001_00000010_00000101_00000001;
	 //addi R3, R2, 8
	 p_mem[3] = 29'b00101_00000011_00000010_00001000;
	 //subi R4, R3, 2
	 p_mem[4] = 29'b00110_00000100_00000011_00000010;
	 //jump R10
	 p_mem[5] = 29'b01010_00001010_00000000_00000000;
  end
  
endmodule