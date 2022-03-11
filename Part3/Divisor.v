module Divisor(
	input [31:0] Divisor_input, //Divisor input
	input rst, //Reset Divisor
	input wrctrl, //write the Divisor into register
	output reg [31:0] Divisor_output //Divisor output
	);
	
always@(wrctrl or rst)begin
	if(rst)Divisor_output=32'd0;//If reset signal is 1,put the value 0 to the output
	else if(wrctrl)Divisor_output=Divisor_input;//If write control signal is 1,put the value of input to the output
end
endmodule
