`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:35 11/28/2016 
// Design Name: 
// Module Name:    Coin 
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
module Coin(
input			clk,
input			rst_n,
input	[3:0]	cur_state,
input			coin_p,	//Í¶±Ò
input		   coin_minus_p,
output	reg	[3:0]	coin_num
    );

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100;	 

reg	[3:0]	coin = 4'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			coin <= 4'h0;
		else if(coin_minus_p)
			if(coin == 4'h0)
				coin <= 4'h0;
			else
				coin <= coin - 4'h1;
		else if(cur_state == COIN)
			if(coin_p)
				if(coin == 4'h9)
					coin <= coin;
				else
					coin <= coin + 4'h1;
			else
				coin <= coin;
		else
			coin <= coin;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			coin_num <= 4'h0;
		else
			coin_num <= coin;
	end

endmodule
