`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:20 11/29/2016 
// Design Name: 
// Module Name:    Error 
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
module Error(
input			clk,
input			rst_n,
input	[3:0]	cur_state,
input			ref_sign,
input	[1:0]	refresh,
output	reg [5:0]	message	// ‰≥ˆ–≈œ¢
    );
	 
parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100;

reg	[5:0]	mes = 6'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			mes <= 6'h0;
		else if(cur_state == ERROR)
			if(ref_sign)
				begin
					case(refresh)
						3'h0:	mes <= 6'd23;	//◊÷ƒ∏N
						3'h1:	mes <= 6'd18;	//◊÷ƒ∏I
						3'h2:	mes <= 6'd24;	//◊÷ƒ∏O
						3'h3:	mes <= 6'd12;	//◊÷ƒ∏C
					endcase
				end
			else
				mes <= mes;
		else
			mes <= mes;
	end
	
always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			message <= 6'h0;
		else
			message <= mes;
	end


endmodule
