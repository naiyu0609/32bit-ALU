`timescale 1ns/1ns
module tb_CompDiv;
reg [31:0] Divisor_input;//The signal of Divisor input
reg [31:0] Dividend_input;//The signal of Dividend input
reg run;//The signal of run control
reg rst;//The signal of reset
reg clk;//The signal of clock
wire ready;//The signal of ready control
wire [31:0] Quotient_output; //Arithmetic result
wire [31:0] Remainder_output; //Remainder

CompDiv Div(Divisor_input,Dividend_input,run,rst,clk,ready,Quotient_output,Remainder_output);//The module of CompDiv

initial begin//Simulation begin
	Divisor_input=32'd1;
	Dividend_input=32'b11111111111111111111111111111111;//All 32-bit are 1
	run=0;
	rst=1;
	clk=1;
#10	rst=0;
#10	run=1;
#10	run=0;
#1500	rst=1;
#10	rst=0;
#20	Divisor_input=32'd15;//test
	Dividend_input=32'd4568;//test
#10	run=1;
#10	run=0;
#1500	$finish;
end
always begin//Creat a clock which the period is 10ns and the duty cycle is 50%
#5	clk=~clk;
end
endmodule
