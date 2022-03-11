module CompMul(
	input [31:0] Multiplicand_input, //Multiplicand input
	input [31:0] Multiplier_input, //Multiplier input
	input run, //Start signal
	input rst, //Reset all the control signals
	input clk, //Clock signal
	output ready, //Result ready
	output [63:0] Product_output //Arithmetic result
	);
	
	wire [31:0]Multiplicand_output;//The wire of multiplicand output
	wire [63:0]Product_input;//The wire of product input
	wire [32:0]Product_input_new;
	wire [5:0]addctrl;//The wire of function code
	wire [4:0]shamt=5'd0;//The wire of shift amount,but this situation don't need,then set the value is 0
	wire zero;//The wire of zero flag
	wire strctrl;//Signal for store the ALU result into Product
	wire wrctrl;//The wire of write control
	reg state;//The state for put the initial value(multiplier input) to product
	reg next_state;//The next state
	
	
	assign Product_input=(state)?{Product_input_new[32:0],Product_output[30:0]}:{32'd0,Multiplier_input};//Set product input

	Control ctr(run,rst,clk,Product_output[0],ready,strctrl,wrctrl,addctrl);//The module of Controller
	Multiplicand Mult(Multiplicand_input,rst,wrctrl,Multiplicand_output);//The module of Multiplicand
	Product Product(Product_input,wrctrl,strctrl,ready,rst,clk,Product_output);//The module of Product
	ALU uut(Multiplicand_output,Product_output[63:32],addctrl,shamt,Product_input_new[31:0],zero,Product_input_new[32]);//The module of ALU
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all setting
			state=0;
			next_state=0;
		end
		else begin
			state=next_state;
			case(state)
				1'd0:if(run)next_state=1'd1;//If run signal is 1,start to multiply
				1'd1:if(ready) next_state=1'd0;//If the multiplication finished go back to the begin
			endcase
		end
	end
endmodule
