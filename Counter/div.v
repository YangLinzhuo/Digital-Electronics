`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:52 10/08/2016 
// Design Name: 
// Module Name:    div 
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
module div(
input				clk,
input				rst_n,
output	reg	cnt_en
);
//clk		____|----|____|----|____|----|____|----|____|----|____|----|____|----|____|----|
//rst_n  -------|_______|----------------------------------------------------------------
//cnt_div----------------|		0		|		1		|		2		| ........|24999998 |24999999 |		0		|		1		|		2		|
//cnt_en _________________________________________________________________________________|-----------|____________

//'.' clk=50MHz, div into 2Hz
//.'. 1 pulse / 25 000 000 clovk
reg   [24:0]	cnt_div;

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt_div <= 25'h0;
	else if(cnt_div == 25'd24_999_999)
		cnt_div <= 25'h0;
	else
		cnt_div <= cnt_div + 25'h1;
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt_en <= 1'b0;
	else if(cnt_div == 25'd24_999_999)
		cnt_en <= 1'b1;
	else
		cnt_en <= 1'b0;
end


endmodule
