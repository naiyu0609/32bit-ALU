module Product(
	input [63:0] Product_input, //Product input
	input wrctrl,//Write control signal
	input strctrl,//Signal for store the ALU result into Product
	input ready,//Ready control signal
	input rst,//Reset signal
	input clk,//Clock
	output reg [63:0] Product_output //Product output
	);

	reg [2:0]state;//The state
	reg [2:0]next_state;//The next state
		
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all output and all setting
			Product_output=64'd0;
			state=3'd0;
	 		next_state=3'd0;
		end
		else begin
			state=next_state;
			case(state)
				3'd0:begin//Put the initial value product input{32'd0,Multiplier} to product output
					if(wrctrl) begin
						Product_output[31:0]=Product_input[31:0];
						Product_output[63:32]=32'd0;
						next_state=3'd1;
					end
				end
				3'd1:next_state=3'd2;//First time need 1 cycle to load initial value
				3'd2:begin//Shift product output
					Product_output=Product_output>>1;
					next_state=3'd3;
				end
				3'd3:begin//Identify put ALU result to product output(higher bits) or not
					if(strctrl) Product_output[63:31]=Product_input[63:31];
					next_state=3'd4;
				end
				3'd4:begin//Identify ready single
					if(ready) begin
						Product_output=Product_output;
						next_state=3'd5;
					end
					else 	next_state=3'd2;
				end
				3'd5:Product_output=Product_output;//maintain result until reset
			endcase
		end
	end
endmodule
