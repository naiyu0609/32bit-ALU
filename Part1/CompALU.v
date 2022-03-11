module CompALU(
	input [31:0] Instruction, //Instruction input
	output [31:0] result, //Arithmetic result
	output zero, //Zero flag
	output carry //Carry flag
	);
	wire [31:0]Src1;//The wire of Source1
	wire [31:0]Src2;//The wire of Source2

	RF RF(Instruction[25:21],Instruction[20:16],Src1,Src2);//The module of register file
	ALU uut(Src1,Src2,Instruction[5:0],Instruction[10:6],result,zero,carry);//The module of ALU

endmodule
