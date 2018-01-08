
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
    p_mem[1] = 29'b00001_00000010_00000000_00000001;
	 p_mem[2] = 29'b00101_00000011_00000010_00001000;
	 p_mem[3] = 29'b00110_00000100_00000011_00000010;
  end
  
endmodule