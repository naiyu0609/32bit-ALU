`timescale 1ns/1ns
module tb_Divisor;
reg [31:0] Divisor_input; //Divisor input
reg rst; //Reset divisor
reg wrctrl; //write the divisor into register
wire [31:0] Divisor_output; //Divisor output

Divisor Div(Divisor_input,rst,wrctrl,Divisor_output);//The module of Divisor

initial begin//Simulation begin
	Divisor_input=32'd0;
	rst=1;
	wrctrl=0;
#10	rst=0;
	Divisor_input=32'd50;
#10	wrctrl=1;
#10 	rst=1;
	wrctrl=0;
#10	rst=0;
	wrctrl=1;
#10	Divisor_input=32'd9832;
	wrctrl=0;
#20	wrctrl=1;
#10	wrctrl=0;
#10;
end
endmodule
