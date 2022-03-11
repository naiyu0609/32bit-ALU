`timescale 1ns/1ns
module tb_CompMul;
reg [31:0] Multiplicand_input;//The signal of multiplicand input
reg [31:0] Multiplier_input;//The signal of multiplier input
reg run;//The signal of run control
reg rst;//The signal of reset
reg clk;//The signal of clock
wire ready;//The signal of ready control
wire [63:0] Product_output;//The value of result

CompMul Mult(Multiplicand_input,Multiplier_input,run,rst,clk,ready,Product_output);//The module of CompMul

initial begin//Simulation begin
	Multiplicand_input=32'd4294967295;//All 32-bit are 1
	Multiplier_input=32'd4294967295;//All 32-bit are 1
	run=0;
	rst=1;
	clk=1;
#10	rst=0;
#10	run=1;
#10	run=0;
#100	rst=1;
#20	rst=0;
	run=1;
#10	run=0;
#1500 	rst=1;
#10	rst=0;
#20	Multiplicand_input=32'd94;//test
	Multiplier_input=32'd2647;//test
#10 	run=1;
#10	run=0;
#1500	$finish;
end
always begin//Creat a clock which the period is 10ns and the duty cycle is 50%
#5	clk=~clk;
end
endmodule
