`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:36 11/28/2016 
// Design Name: 
// Module Name:    RandomNumber 
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
module RandomNumber(
input	clk,
input	rst_n,
input rand_en,	//Ê¹ÄÜ
output reg [3:0] randNum
    );

reg [7:0] tmp = 8'hFF;
reg [25:0] count = 26'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			count <= 26'h0;
		else if(count == 26'd2_499_999)
			count <= 26'h0;
		else
			count <= count + 26'h1;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			tmp <= 8'hFF;
		else
			begin
				tmp[0] <= tmp[7];
				tmp[1] <= tmp[0];
				tmp[2] <= tmp[1];
				tmp[3] <= tmp[2];
				tmp[4] <= tmp[3] ^ tmp[7];
				tmp[5] <= tmp[4] ^ tmp[7];
				tmp[6] <= tmp[5] ^ tmp[7];
				tmp[7] <= tmp[6];
			end
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			randNum <= 4'h0;
		else if(rand_en)
			begin
				if(count == 26'd2_499_999)
					randNum <= tmp % 16;
				else
					randNum <= randNum;
			end
		else
			randNum <= randNum;
	end

endmodule
