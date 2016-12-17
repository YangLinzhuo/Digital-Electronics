`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:03 11/28/2016 
// Design Name: 
// Module Name:    Refresh 
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
module Refresh(
input						clk,			//时钟
output	wire [1:0]	refresh,		//刷新数码管的显示位置
output	reg  ref_sign
);
//'.' clk=50MHz, div into 1KHz
//.'. 1  / 50 000 clovk
reg   [15:0]	div = 16'h0;
reg	[1:0]		num = 2'h0;


always@(posedge clk)
	begin
		if(div == 16'd49_999)
			div <= 16'h0;
		else
			div <= div + 16'h1;
	end

always@(posedge clk)
	begin
		if(div == 16'd49_999)
			begin
				if(num == 2'h3)
					num <= 2'h0;
				else
					num <= num + 2'h1;
			end
		else
			num <= num;
	end

always@(posedge clk)
	begin
		if(div == 16'd49_999)
			ref_sign <= 1;
		else
			ref_sign <= 0;
	end

assign refresh = num;

endmodule