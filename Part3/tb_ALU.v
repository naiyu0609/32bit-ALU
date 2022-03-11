`timescale 1ns/1ns
module tb_ALU();

	reg [31:0]Src1;//The signal of Source1
	reg [31:0]Src2;//The signal of Source2
	reg [5:0]funct;//The signal of function code
	reg [4:0]shamt;//The signal of shift amount
	wire [31:0]result;//The signal of result
	wire zero;//The signal of zero flag
	wire carry;//The signal of carry flag

	ALU uut(Src1,Src2,funct,shamt,result,zero,carry);//The module of ALU

	initial begin//simulation begin
		Src1=0;
		Src2=0;
		funct=0;
		shamt=0;

	#20 	funct=6'd27;
	#10  	Src1=32'b10000000000000000000000000000000;
	 	Src2=32'b10000000000000000000000000000000;

	#10  	Src1=32'd3;
	 	Src2=32'd4;

	#10	funct=6'd28;
		
	#10  	Src1=32'd64;
	 	Src2=32'd64;

	#10	funct=6'd29;
		shamt=5'd1;	

	#10 	shamt=5'd2;

	#10	funct=6'd30;
		shamt=5'd1;

	#10 	shamt=5'd2;

	#10 	funct=6'd31;
		Src1=32'd3;
	 	Src2=32'd6;

	#10	funct=6'd32;
		Src1=32'd3;
	 	Src2=32'd5;
	#10	funct=6'd0;
	#20;
	end
endmodule
