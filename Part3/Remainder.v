module Remainder(
	input [63:0] Remainder_input, //Remainder input
	input wrctrl,//Write control signal
	input ozctrl,//Add 1 or 0 at the least bit
	input ready,//Ready control signal
	input ready_wait,//Ready control singal before shift right
	input rst,//Reset signal
	input clk,//Clock
	output reg [31:0] Remainder_output, //Remainder output
	output reg [31:0] Quotient_output //Quotient output
	);

	reg [2:0]state;//The state
	reg [2:0]next_state;//The next state
		
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all output and all setting
			Remainder_output=32'd0;
			Quotient_output=32'd0;
			state=3'd0;
	 		next_state=3'd0;
		end
		else begin
			state=next_state;
			case(state)
				3'd0:begin//Put the initial value Remainder input{32'd0,Dividend} to Remainder output and Quotient output
					if(wrctrl) begin
						Quotient_output[31:0]=Remainder_input[31:0];
						Remainder_output[31:0]=32'd0;
						next_state=3'd1;
					end
				end
				3'd1:begin//Fitst time shift left
					{Remainder_output,Quotient_output}={Remainder_output,Quotient_output}<<1;
					next_state=3'd2;
				end
				3'd2:begin//Put ALU result(SUB) into Remainder output
					Remainder_output[31:0]=Remainder_input[63:32];
					next_state=3'd3;
				end
				3'd3:next_state=3'd4;//One cycle to load result
				3'd4:begin//Identify put 1 or 0 at the least bit 
					if(ozctrl) begin
						{Remainder_output,Quotient_output}={Remainder_output,Quotient_output}<<1;
						{Remainder_output,Quotient_output}={Remainder_output,Quotient_output}+1;
					end
					else begin
						Remainder_output[31:0]=Remainder_input[63:32];
						{Remainder_output,Quotient_output}={Remainder_output,Quotient_output}<<1;
					end
					next_state=3'd5;
				end
				3'd5:begin//Identify ready single before shift right
					if(ready_wait) begin
						Remainder_output=Remainder_output>>1;
						next_state=3'd6;
					end
					else 	next_state=3'd2;
				end
				3'd6:begin//maintain result until reset
					Remainder_output=Remainder_output;
					Quotient_output=Quotient_output;
				end
			endcase
		end
	end
endmodule
