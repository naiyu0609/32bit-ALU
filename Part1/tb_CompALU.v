`timescale 1ns/1ns
module tb_CompALU;
reg [31:0] Instruction;//The signal of instruction
wire [31:0] result;//The signal of result
wire zero;//The signal of zero flag
wire carry;//The signal of carry flag

CompALU CPU(Instruction,result,zero,carry);//The module of CompALU

initial begin//Simulation begin
	Instruction=32'b000000_00000_00000_00000_00000_000000;
#10	Instruction=32'b000000_01011_10101_00000_00000_011011;//Number11 register(2000) ADD Number21 register(180)
#10	Instruction=32'b000000_01011_01001_00000_00000_011100;//Number11 register(2000) SUB Number9 register(44)
#10	Instruction=32'b000000_01001_01001_00000_00000_011100;//Number9 register(44) SUB Number9 register(44)
#10	Instruction=32'b000000_01001_00000_00000_00001_011101;//Number9 register(44) SRL 1bit
#10	Instruction=32'b000000_01001_00000_00000_00010_011101;//Number9 register(44) SRL 2bits
#10	Instruction=32'b000000_01001_00000_00000_00001_011110;//Number9 register(44) SLL 1bit
#10	Instruction=32'b000000_01001_00000_00000_00010_011110;//Number9 register(44) SLL 2bits
#10	Instruction=32'b000000_11011_11001_00000_00000_011111;//Number27 register(39) XOR Number25 register(43)
#10	Instruction=32'b000000_00011_11101_00000_00000_100000;//Number3 register(365) AND Number29 register(92)
#10;
end
endmodule
