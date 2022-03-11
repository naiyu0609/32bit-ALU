`timescale 1ns/1ns
module tb_Multiplicand;
reg [31:0] Multiplicand_input; //Multiplicand input
reg rst; //Reset multiplicand
reg wrctrl; //write the multiplicand into register
wire [31:0] Multiplicand_output; //Multiplicand output

Multiplicand Mult(Multiplicand_input,rst,wrctrl,Multiplicand_output);//The module of Multiplicand

initial begin//Simulation begin
	Multiplicand_input=32'd0;
	rst=1;
	wrctrl=0;
#10	rst=0;
	Multiplicand_input=32'd50;
#10	wrctrl=1;
#10 	rst=1;
	wrctrl=0;
#10	rst=0;
	wrctrl=1;
#10	Multiplicand_input=32'd9832;
	wrctrl=0;
#20	wrctrl=1;
#10	wrctrl=0;
#10;
end
endmodule
