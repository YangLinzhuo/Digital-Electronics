`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:24 11/28/2016 
// Design Name: 
// Module Name:    RemoveJitter 
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
module RemoveJitter(
input				clk,
input				rst_n,
input				start,
input				coin,
input				score,
output	wire	start_p,
output	wire	coin_p,
output	wire	score_p
    );

reg	[19:0]	cnt = 20'h0;	 

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 20'h0;
		else if(~start && ~coin && ~score)
			cnt <= 20'h0;
		else if(cnt > 20'd1_000_000)
			cnt <= cnt;
		else
			cnt <= cnt + 20'h1;
	end

reg	[2:0] start_delay	= 3'h0;
reg	[2:0] coin_delay = 3'h0;
reg	[2:0]	score_delay = 3'h0;

always @ (posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			begin
				start_delay <= 3'h0;
				coin_delay <= 3'h0;
				score_delay <= 3'h0;
			end
		else if(cnt < 20'd999_998)
			begin
				start_delay <= 3'h0;
				coin_delay	<= 3'h0;
				score_delay <= 3'h0;
			end
		else
			begin
				start_delay <= {start_delay[1:0], start};
				coin_delay <= {coin_delay[1:0], coin};
				score_delay <= {score_delay[1:0], score};
			end
	end

assign start_p = start_delay[1] && (~start_delay[2]);       // 原信号上升沿位置处产生的pulse信号
assign coin_p = coin_delay[1] && (~coin_delay[2]); 
assign score_p = score_delay[1] && (~score_delay[2]);


endmodule
