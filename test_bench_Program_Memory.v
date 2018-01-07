module test_bench_Program_Memory();
  reg [28:0] add;
  wire [28:0] instruction;
  
  Program_Memory pm(add, instruction);
  
  initial
  begin
    add = 0;
    #5 add = 1;
  end
endmodule