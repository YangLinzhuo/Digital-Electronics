`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:38 10/26/2016 
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
input						clk,			//Ê±ÖÓ
output		reg		refresh		//Ë¢ÐÂÐÅºÅ
);
//'.' clk=50MHz, div into 1KHz
//.'. 1  / 50 000 clovk
reg   [15:0]	div = 16'h0;
reg				sign = 1'b0;

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
		sign <= ~sign;
	else
		sign <= sign;
end

always@(*)
begin
	refresh <= sign;
end

endmodule
