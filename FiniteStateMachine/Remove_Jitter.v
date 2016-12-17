`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:21:06 11/03/2016 
// Design Name: 
// Module Name:    Remove_Jitter 
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
module Remove_Jitter(
input				clk,
input				rst_n,
input				button,
output	wire	pulse_p
    );

reg	[25:0]	cnt_ = 26'h0;	 

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt_ <= 26'h0;
		else if(~button)
			cnt_ <= 26'h0;
		else if(cnt_ > /*26'd5000*/26'd500_000)
			cnt_ <= cnt_;
		else
			cnt_ <= cnt_ + 1'h1;
	end

reg[2:0] delay;

always @ (posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			delay <= 3'h0;
		else if(cnt_ < /*26'd4998*/26'd499_998)
			delay <= 3'h0;
		else
			delay <= {delay[1:0], button};
	end

assign pulse_p = delay[1] && (~delay[2]);       // 原信号上升沿位置处产生的pulse信号
/*wire neg_signal = ( ~delay[1] ) && delay[2];      // 原信号下降沿位置处产生的pulse信号*/


endmodule

