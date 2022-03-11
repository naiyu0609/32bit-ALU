module CompDiv(
	input [31:0] Divisor_input, //Divisor input
	input [31:0] Dividend_input, //Dividend input
	input run, //Start signal
	input rst, //Reset all the control signals
	input clk, //Clock signal
	output ready, //Result ready
	output [31:0] Quotient_output, //Arithmetic result
	output [31:0] Remainder_output //Remainder
	);
	
	wire [31:0]Divisor_output;//The wire of multiplicand output
	wire [63:0]Remainder_input;//The wire of product input
	wire [32:0]Remainder_input_new;
	wire [5:0]ALUfun;//The wire of function code
	wire [4:0]shamt=5'd0;//The wire of shift amount,but this situation don't need,then set the value is 0
	wire zero;//The wire of zero flag
	wire carry;//The wire of carry flag
	wire wrctrl;//The wire of write control
	wire ready_wait;//The wire of ready signal before shift right
	reg state;//The state for put the initial value(multiplier input) to product
	reg next_state;//The next state
	
	
	assign Remainder_input=(state)?{Remainder_input_new[31:0],Quotient_output[31:0]}:{32'd0,Dividend_input};//Set remainder input

	Control ctr(run,rst,clk,Remainder_output[31],ready,ready_wait,wrctrl,ozctrl,ALUfun);//The module of Controller
	Divisor Div(Divisor_input,rst,wrctrl,Divisor_output);//The module of Divisor
	Remainder Remainder(Remainder_input,wrctrl,ozctrl,ready,ready_wait,rst,clk,Remainder_output,Quotient_output);//The module of remainder
	ALU uut(Remainder_output[31:0],Divisor_output,ALUfun,shamt,Remainder_input_new[31:0],zero,carry);//The module of ALU
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all setting
			state=0;
			next_state=0;
		end
		else begin
			state=next_state;
			case(state)
				1'd0:if(run)next_state=1'd1;//If run signal is 1,start to multiply
				1'd1:if(ready)next_state=1'd0;//If the Divide finished go back to the begin
			endcase
		end
	end
endmodule
