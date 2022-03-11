module Control(
	input run,//Signal for start the multiplication
	input rst,//Signal for reset
	input clk,//Clock
	input fsb,//The first bit of multiplier
	output reg ready,//Result ready
	output reg ready_wait,//Result ready but need to shift right
	output reg wrctrl,//The signal of write control
	output reg ozctrl,//Add one or zero at the least Remainder
	output reg [5:0] ALUfunction //for ALU function
	);
	reg [2:0]state;//The state
	reg [2:0]next_state;//The next state
	integer i;//Creat the integer i to make sure how much counted
	
	always@(posedge clk or posedge rst)begin
		if(rst)begin//If reset signal is 1,put the value 0 to all output and all setting
			i=0;
			ready=0;
			ready_wait=0;
			wrctrl=0;
			ozctrl=0;
			ALUfunction=6'd0;
			state=3'd0;
			next_state=3'd0;
		end
		else begin
			ready=0;//Everytime needs to clear previous setting
			ready_wait=0;
			wrctrl=0;
			ALUfunction=6'd0;
			state=next_state;
			case(state)				
				3'd0:begin//Identify can run or not
					i=0;
					if(run) begin
						wrctrl=1;
						next_state=3'd1;
					end
				end
				3'd1:next_state=3'd2;//This Cycle Remainder is doing another work
				3'd2:begin//Control ALU to do SUB function
					ALUfunction=6'd28;
					next_state=3'd3;
				end
				3'd3:next_state=3'd4;//One Cycle to load result
				3'd4:begin//Identify the first bit to restore original value or not
					if(fsb) begin
						ALUfunction=6'd27;
						ozctrl=0;
					end
					else begin
						ozctrl=1;
					end
					next_state=3'd5;
				end
				3'd5:begin//Check times
					i=i+1;
					if(i==32) begin
						ready_wait=1;
						next_state=3'd6;
					end
					else next_state=3'd2;
				end
				3'd6:ready=1;//maintain ready until reset
			endcase
		end		
	end
endmodule
