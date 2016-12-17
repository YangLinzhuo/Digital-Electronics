`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:10 11/29/2016 
// Design Name: 
// Module Name:    Constraint 
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
module Constraint(
input		clk,
input		rst_n,
input		lose_p,
input	[3:0]	coin_num,
output reg start_constraint,
output wire coin_minus_p
    );


parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100, PASS = 4'b0101;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			start_constraint <= 0;
		else if(coin_num == 4'h0)
			start_constraint <= 1;
		else
			start_constraint <= 0;
	end

reg [2:0] turn_delay = 3'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			turn_delay <= 3'h0;
		else
			turn_delay <= {turn_delay[1:0], lose_p};
	end


assign coin_minus_p = turn_delay[1] && (~turn_delay[2]);


endmodule
