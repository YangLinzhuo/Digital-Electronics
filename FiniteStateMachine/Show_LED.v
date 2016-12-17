`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:28 11/03/2016 
// Design Name: 
// Module Name:    Show_LED 
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
module Show_LED(
input						clk,
input						rst_n,
input						result,
input						pulse_p,
output	reg	[7:0] Led
    );

reg	[3:0]		cnt = 4'h1;
reg	[7:0]		eight_bit = 8'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cnt <= 4'h1;
		else if(pulse_p)
			begin
				if(cnt == 4'h8)
					cnt <= 4'h1;
				else
					cnt <= cnt + 1'h1;
			end
		else
			cnt <= cnt;
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			eight_bit <= 8'h0;
		else if(pulse_p)
			eight_bit[8 - cnt] <= result;
		else
			eight_bit <= eight_bit;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			Led <= 8'h0;
		else
			Led <= eight_bit;
	end

endmodule
