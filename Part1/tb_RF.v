`timescale 1ns/1ns
module tb_RF;
reg[4:0]Address1;//The signal of address1
reg[4:0]Address2;//The signal of address2
wire[31:0]Source1;//The signal of source1
wire[31:0]Source2;//The signal of source2

integer i;//Creat the integer i to test each register

RF RF(Address1,Address2,Source1,Source2);//The module of register file

initial begin//Simulation begin
	Address1=0;
	Address2=0;
#10
	for(i=0;i<31;i=i+2)begin
		Address1=i;
		Address2=i+1;
		#10;
	end
end
endmodule
