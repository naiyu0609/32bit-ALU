`timescale 1ns/1ns
module tb_Control;
reg run;//The signal of run
reg rst;//The signal of reset
reg clk;//The signal of clock
reg lsb;//The signal of the least bit of multiplier
wire ready;//The signal of ready signal
wire strctrl;//Signal for store the ALU result into Product
wire wrctrl;//The signal of write control
wire [5:0] addctrl;//The signal of function code

Control Ctr1(run,rst,clk,lsb,ready,strctrl,wrctrl,addctrl);//The module of Controller

initial begin//Simulation begin
	rst=1;
	run=0;
	clk=1;
	lsb=0;
#10	rst=0;
	run=1;
#10	run=0;
	lsb=1;
#10	lsb=0;
#10 	rst=1;
#10	rst=0;
	run=1;
	lsb=1;
#10	run=0;
	lsb=1;
#30	lsb=0;
#30	lsb=0;
#30	lsb=1;
#1000 	rst=1;
#10	rst=0;
	run=1;
#10	run=0;
#100	$finish;
end
always begin//Creat a clock which the period is 10ns and the duty cycle is 50%
#5	clk=~clk;
end
endmodule
