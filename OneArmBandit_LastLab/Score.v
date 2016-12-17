`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:36 11/28/2016 
// Design Name: 
// Module Name:    Score 
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
module Score(
input		clk,
input		rst_n,
input		turn_p,
input		ref_sign,
input	[1:0]	refresh,
input	[3:0]	number1,
input	[3:0] number2,
input	[3:0] number3,
input			score_reset,
output	reg [3:0] number,
output	wire pass_p,
output	wire lose_p
    );

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100;

reg [3:0] score1 = 4'h0;
reg [3:0] score2 = 4'h0;
reg [5:0] sum = 6'h0;
reg [5:0] tmp = 6'h0;
reg 		 is_same = 0;
reg		 not_same = 0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			begin
				sum <= 8'h0;
				is_same <= 0;
				not_same <= 0;
			end
		else if(turn_p)
			begin
				sum <= number1 + number2 + number3;
				is_same <= (number1 == number2) && (number2 == number3);
				not_same <= (number1 != number2) || (number2 != number3) || (number1 != number3);
			end
		else if(score_reset)	//ÇåÁã
			begin
				sum <= 0;
				is_same <= 0;
				not_same <= 0;
			end
	end
	
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			tmp <= 6'h0;
		else if(turn_p)
			tmp <= 6'h0;
		else if(tmp < sum)
			tmp <= tmp + 6'h1;
		else if(score_reset)
			tmp <= 6'h0;
		else
			tmp <= tmp;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			score1 <= 4'h0;
		else if(score_reset)
			score1 <= 4'h0;
		else if(tmp < sum)
			begin
				if(score1 == 4'd9)
					score1 <= 4'h0;
				else
					score1 <= score1 + 4'h1;
			end
		else
			score1 <= score1;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			score2 <= 4'h0;
		else if(score_reset)
			score2 <= 4'h0;
		else if(tmp < sum)
			begin
				if(score1 == 4'd9)
					begin
						if(score2 == 4'd9)
							score2 <= 4'h0;
						else
							score2 <= score2 + 4'h1;
					end
				else
					score2 <= score2;
			end
	end


always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			number <= 4'h0;
		else if(ref_sign)
			case(refresh)
				2'h0:	number <= score1;
				2'h1: number <= score2;
			endcase
		else
			number <= number;
	end
	


reg  [2:0]	pass_delay = 3'h0;
reg  [2:0]  lose_delay = 3'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			begin
				pass_delay <= 3'h0;
				lose_delay <= 3'h0;
			end
		else if(score_reset)
			begin
				pass_delay <= 3'h0;
				lose_delay <= 3'h0;
			end
		else 
			begin
				pass_delay <= {pass_delay[1:0], is_same || sum >= 30};
				lose_delay <= {lose_delay[1:0], not_same && sum < 30};
			end
	end


assign pass_p = pass_delay[1] && (~pass_delay[2]);
assign lose_p = lose_delay[1] && (~lose_delay[2]);


endmodule
