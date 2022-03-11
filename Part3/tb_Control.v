`timescale 1ns/1ns
module tb_Control;
reg run;//Signal for start the multiplication
reg rst;//Signal for reset
reg clk;//Clock
reg fsb;//The first bit of multiplier
wire ready;//Result ready
wire ready_wait;//Result ready but need to shift right
wire wrctrl;//The signal of write control
wire ozctrl;//Add one or zero at the least Remainder
wire [5:0] ALUfunction; //for ALU function

Control Ctr1(run,rst,clk,fsb,ready,ready_wait,wrctrl,ozctrl,ALUfunction);//The module of Controller

initial begin//Simulation begin
	rst=1;
	run=0;
	clk=1;
	fsb=0;
#10	rst=0;
	run=1;
#10	run=0;
	fsb=1;
#10	fsb=0;
#10 	rst=1;
#10	rst=0;
	run=1;
	fsb=1;
#10	run=0;
	fsb=1;
#30	fsb=0;
#30	fsb=0;
#30	fsb=1;
#1500 	rst=1;
#10	rst=0;
	run=1;
	fsb=1;
#10	run=0;
	fsb=1;
#30	fsb=0;
#30	$finish;
end
always begin//Creat a clock which the period is 10ns and the duty cycle is 50%
#5	clk=~clk;
end
endmodule
