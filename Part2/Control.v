module Control(
	input run,//Signal for start the multiplication
	input rst,//Signal for reset
	input clk,//Clock
	input lsb,//The least bit of multiplier
	output reg ready,//Result ready
	output reg strctrl, //Signal for store the ALU result into Product
	output reg wrctrl,//The signal of write control
	output reg [5:0] addctrl //for ALU function
	);
	reg [2:0]state;//The state
	reg [2:0]next_state;//The next state
	reg strctrl_wait;//We need to shift fitst,so we creat a register to store the state
	integer i;//Creat the integer i to make sure how much counted
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all output and all setting
			i=0;
			ready=0;
			strctrl=0;
			strctrl_wait=0;
			wrctrl=0;
			addctrl=6'd0;
			state=3'd0;
			next_state=3'd0;
		end
		else begin
			ready=0;//Everytime needs to clear previous setting
			strctrl=0;
			wrctrl=0;
			addctrl=6'd0;
			state=next_state;
			case(state)				
				3'd0:begin//Identify can run or not
					i=0;
					if(run) begin
						wrctrl=1;
						next_state=3'd1;
					end
				end
				3'd1:next_state=3'd2;
				3'd2:begin//Identify lsb use ALU to ADD or not
					if(lsb) begin
						addctrl=6'd27;
						strctrl_wait=1;
					end
					next_state=3'd3;
				end
				3'd3:begin//Identify strctrl_wait load ALU result or not
					if(strctrl_wait) begin
						strctrl=1;
						strctrl_wait=0;
					end
					next_state=3'd4;
				end
				3'd4:begin//Check times
					i=i+1;
					if(i==32) begin
						ready=1;
						next_state=3'd5;
					end
					else next_state=3'd2;
				end
				3'd5:ready=1;//Maintain ready until reset
			endcase
		end		
	end
endmodule
