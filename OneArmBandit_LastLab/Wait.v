`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:55 12/01/2016 
// Design Name: 
// Module Name:    Wait 
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
module Wait(
input		clk,
input		rst_n,
input	[3:0] cur_state,
//input		coin_p,
output	reg	score_reset,
output	reg [5:0]	wait_message
    );

parameter	WAIT = 4'b0111, COIN = 4'b0100;

reg	[26:0] cnt = 27'h0;	//计时
reg	[5:0]  count = 6'd9; //计数

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 27'h0;
		else if(cur_state == WAIT)
			if(cnt == 27'd49_999_999)
				cnt <= 27'h0;
			else
				cnt <= cnt + 27'h1;
		else
			cnt <= 27'h0;
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			count <= 6'd9;
		else if(cur_state == WAIT)
			begin
			if(cnt == 26'd49_999_999)
				if(count == 6'h0)
					count <= 6'h0;
				else
					count <= count - 6'h1;
			end
		else if(cur_state == COIN)
			count <= count;
		else
			count <= 6'h9;
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			score_reset <= 0;
		else if(cur_state == WAIT)
			if(count == 4'h0)
				score_reset <= 1;
			else
				score_reset <= 0;
		else
			score_reset <= 0;
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			wait_message <= 6'h0;
		else
			wait_message <= count;
	end

endmodule
