`timescale 1ns/1ns
module tb_Remainder;
reg [63:0] Remainder_input; //Remainder input
reg wrctrl;//Write control signal
reg ozctrl;//Add 1 or 0 at the least bit
reg ready;//Ready control signal
reg ready_wait;//Ready control singal before shift right
reg rst;//Reset signal
reg clk;//Clock
wire [31:0] Remainder_output; //Remainder output
wire [31:0] Quotient_output; //Quotient output

Remainder Remainder(Remainder_input,wrctrl,ozctrl,ready,ready_wait,rst,clk,Remainder_output,Quotient_output);//The module of Remainder

initial begin//Simulation begin
	Remainder_input=64'd0;
	wrctrl=0;
	ozctrl=0;
	ready=0;
	ready_wait=0;
	rst=1;
	clk=1;
#10	rst=0;
	Remainder_input=64'd12;
#10	wrctrl=1;
#10	wrctrl=0;
	Remainder_input=64'd4294967296;//32-bit is 1,other are 0
#10	rst=1;
#10	rst=0;
	Remainder_input=64'd16;
#10	wrctrl=1;
#10	wrctrl=0;
	Remainder_input=64'd4294967296;
#20	ozctrl=1;
#30	ozctrl=0;
#60	ozctrl=1;
#60	ready_wait=1;
#10	ready=1;
#30    $finish;
end

always #5 begin//Creat a clock which the period is 10ns and the duty cycle is 50%
  clk = ~clk;
end
endmodule

