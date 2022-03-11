module Multiplicand(
	input [31:0] Multiplicand_input, //Multiplicand input
	input rst, //Reset multiplicand
	input wrctrl, //write the multiplicand into register
	output reg [31:0] Multiplicand_output //Multiplicand output
	);
	
always@(wrctrl or rst)begin
	if(rst)Multiplicand_output=32'd0;//If reset signal is 1,put the value 0 to the output
	else if(wrctrl)Multiplicand_output=Multiplicand_input;//If write control signal is 1,,put the value of input to the output
end
endmodule
