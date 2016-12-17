`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:42:25 10/26/2016 
// Design Name: 
// Module Name:    ShowDigitalNum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ShowDigitalNum(
input						refresh,		//刷新信号
input				[7:0]	cnt_data,
output 	reg	[3:0]	sel,
output	reg	[7:0]	data	//data[7:0] = {a,b,c,d,e,f,g}
);

reg	[3:0] num = 4'h0;
reg	[3:0]	select = 4'b1110;

always@(*)
begin
	if(refresh)
		select  <=  4'b1110;
	else
		select  <=  4'b1101;
end



always@(*)
begin
	if(refresh)
		num <= cnt_data;
	else
		num <= {cnt_data[7],cnt_data[6],cnt_data[5],cnt_data[4]};
end

always@(*)
begin
	case(num)
			4'h0:		data		<= 8'b0000_0011;		//对于共阳极数码管
			4'h1:		data		<= 8'b1001_1111;		//低电平对应位的灯亮
			4'h2:		data		<= 8'b0010_0101;		//高电平对应位的灯灭
			4'h3:		data		<= 8'b0000_1101;
			4'h4:		data		<= 8'b1001_1001;
			4'h5:		data		<= 8'b0100_1001;
			4'h6:		data		<= 8'b0100_0001;
			4'h7:		data		<= 8'b0001_1111;
			4'h8:		data		<= 8'b0000_0001;
			4'h9:		data		<= 8'b0000_1001;
			default:	data		<= 8'b1111_1111;
	endcase
end

always@(*)
begin
	sel <= select;
end

endmodule
