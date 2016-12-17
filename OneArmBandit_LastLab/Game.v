`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:24:28 11/28/2016 
// Design Name: 
// Module Name:    Game 
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
module Game(
input		clk,
input		rst_n,
input		start_p,
input	[3:0]	cur_state,
input	[1:0] refresh,
input		ref_sign,
input	[3:0] randNum,
output	reg [3:0] result,
output	reg [3:0] number1,
output	reg [3:0] number2,
output	reg [3:0] number3,
output	reg 		 score_reset,	//分数清零信号
output	wire turn_p	//游戏进行完一轮的信号
    );

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100;

reg [2:0] choose = 3'h4;
reg [3:0] data2 = 4'h0;
reg [3:0] data1 = 4'h0;
reg [3:0] data0 = 4'h0;	//分别存储三个数码管位中的数据
reg [3:0] info = 4'h0;

reg [2:0] turn_delay = 3'b111;

reg [26:0] cnt = 27'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 27'h0;
		else if(cur_state != GAME)
			cnt <= 27'h0;
		else if(cnt == 27'd99_999_999)
			cnt <= 27'h0;
		else
			cnt <= cnt + 27'h1;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			choose <= 3'h5;
		else if(cur_state == GAME)
			if(start_p)
				if(choose >= 3'h4)
					choose <= 4'h0;
				else
					choose <= choose;
			else if(cnt == 27'd99_999_999)
				begin
					if(choose == 3'h5)
						choose <= choose;
					else
						choose <= choose + 3'h1;
				end
		else
			choose <= choose;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			begin
				data0 <= 4'h0;
				data1 <= 4'h0;
				data2 <= 4'h0;
			end
		else
			case(choose)
				3'h0:
					begin
						data0 <= randNum;
						data1 <= 4'h0;
						data2 <= 4'h0;
					end
				3'h1:	data1 <= randNum;
				3'h2: data2 <= randNum;
			endcase
	end


always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			info <= 4'h0;
		else if(ref_sign)
			case(refresh)
				2'h0:	info <= data0; 
				2'h1: info <= data1;
				2'h2: info <= data2;
			endcase
		else
			info <= info;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			result <= 4'h0;
		else
			result <= info;
	end
	

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			begin
				number1 <= 4'h0;
				number2 <= 4'h0;
				number3 <= 4'h0;
			end
		else
			begin
				number1 <= data0;
				number2 <= data1;
				number3 <= data2;
			end
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			turn_delay <= 3'b111;
		else
			turn_delay <= {turn_delay[1:0], choose == 3'h4};
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			score_reset <= 0;
		else if(choose == 3'h0)
			score_reset <= 1;
		else
			score_reset <= 0;
	end

assign turn_p = turn_delay[1] && (~turn_delay[2]); 

endmodule
