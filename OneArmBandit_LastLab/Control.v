`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:10 11/28/2016 
// Design Name: 
// Module Name:    Control 
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
module Control(
input		clk,
input		rst_n,
input		start_p,	//开始游戏
input		coin_p,	//显示硬币数
input		score_p,	//显示分数
input		start_constraint,
input		pass_p,
input		lose_p,
output	reg [3:0]	cur_state
    );
	 

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100, PASS = 4'b0101, LOSE = 4'b0110;

reg	[3:0]	state = WELCOME; 
reg	[25:0]	cnt = 26'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			state <= WELCOME;
		else if(start_p)
			begin
				if(start_constraint)
					state <= ERROR;
				else
					state <= GAME;
			end
		else if(coin_p)
			state <= COIN;
		else if(score_p)
			state <= SCORE;
		else if(pass_p)
			state <= PASS;
		else if(lose_p)
			state <= LOSE;
		else if(cnt == 26'd199_999_999)
			state <= GAME;
		else
			state <= state;
	end


always@(posedge clk)
	begin
		cur_state <= state;
	end
	


always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 26'h0;
		else if(state == PASS || state == LOSE)
			if(cnt == 26'd199_999_999)
				cnt <= 26'h0;
			else
				cnt <= cnt + 16'h1;
		else
			cnt <= 26'h0;
	end

endmodule
