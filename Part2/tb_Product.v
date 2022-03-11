`timescale 1ns/1ns
module tb_Product;
reg [63:0] Product_input; //The signal of input
reg wrctrl;//The signal of write control
reg strctrl;//Signal for store the ALU result into Product
reg ready;//The signal of ready control
reg rst;//The signal of reset
reg clk;//The signal of clock
wire [63:0] Product_output;//The signal of output

Product Product(Product_input,wrctrl,strctrl,ready,rst,clk,Product_output);//The module of Product

initial begin//Simulation begin
	Product_input=64'd0;
	wrctrl=0;
	strctrl=0;
	ready=0;
	rst=1;
	clk=1;
#10	rst=0;
	Product_input=64'd12;
#10	wrctrl=1;
#10	wrctrl=0;
	Product_input=64'b1111111111_1111111111_1111111111_1111111111_1111111111_1111111111_1111;
#20	strctrl=1;
#10	strctrl=0;
#10	strctrl=1;
#10	rst=1;
#10	rst=0;
	Product_input=64'd16;
#10	wrctrl=1;
#10	wrctrl=0;
	Product_input=64'b1111111111_1111111111_1111111111_1111111111_1111111111_1111111111_1111;
#10	strctrl=1;
#20	strctrl=0;
	Product_input=64'b0000000000_0000000001_1111111111_1111111111_1111111111_1111111111_1111;
#40	strctrl=1;
#40	ready=1;
#50    $finish;
end

always #5 begin//Creat a clock which the period is 10ns and the duty cycle is 50%
  clk = ~clk;
end
endmodule

