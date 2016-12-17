`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:52 11/28/2016 
// Design Name: 
// Module Name:    StartButtonRemoveJitter 
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
module StartButtonRemoveJitter(
input				clk,
input				rst_n,
input				start,
output	wire	start_p
    );

reg	[19:0]	cnt = 20'h0;	 

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 20'h0;
		else if(~start)
			cnt <= 20'h0;
		else if(cnt > 20'd500_000)
			cnt <= cnt;
		else
			cnt <= cnt + 20'h1;
	end

reg[2:0] delay;

always @ (posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			delay <= 3'h0;
		else if(cnt < 20'd499_998)
			delay <= 3'h0;
		else
			delay <= {delay[1:0], button};
	end

assign start_p = delay[1] && (~delay[2]);       // 原信号上升沿位置处产生的pulse信号
/*wire neg_signal = ( ~delay[1] ) && delay[2];      // 原信号下降沿位置处产生的pulse信号*/


endmodule
