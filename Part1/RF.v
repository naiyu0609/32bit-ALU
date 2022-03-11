module RF(
	input [4:0] Address1, //Source 1 address
	input [4:0] Address2, //Source 2 address
	output [31:0] Source1, //Source 1 value
	output [31:0] Source2 //Source 2 value
	);
	wire [31:0]register[31:0];//Creat 32 registers

	assign register[0]=32'd21;//Number0
	assign register[1]=32'd444;//Number1
	assign register[2]=32'd178;//Number2
	assign register[3]=32'd365;//Number3
	assign register[4]=32'd33;//Number4
	assign register[5]=32'd89;//Number5
	assign register[6]=32'd49;//Number6
	assign register[7]=32'd11;//Number7
	assign register[8]=32'd347;//Number8
	assign register[9]=32'd44;//Number9
	assign register[10]=32'd1000;//Number10
	assign register[11]=32'd2000;//Number11
	assign register[12]=32'd71;//Number12
	assign register[13]=32'd38;//Number13
	assign register[14]=32'd19;//Number14
	assign register[15]=32'd51;//Number15
	assign register[16]=32'd663;//Number16
	assign register[17]=32'd1871;//Number17
	assign register[18]=32'd364;//Number18
	assign register[19]=32'd1110;//Number19
	assign register[20]=32'd197;//Number20
	assign register[21]=32'd180;//Number21
	assign register[22]=32'd1;//Number22
	assign register[23]=32'd619;//Number23
	assign register[24]=32'd42;//Number24
	assign register[25]=32'd43;//Number25
	assign register[26]=32'd831;//Number26
	assign register[27]=32'd39;//Number27
	assign register[28]=32'd734;//Number28
	assign register[29]=32'd92;//Number29
	assign register[30]=32'd3456;//Number30
	assign register[31]=32'd1234;//Number31

	assign Source1=register[Address1];//Put the register value which address is address1 in the Source1
	assign Source2=register[Address2];//Put the register value which address is address2 in the Source2

endmodule
