`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:00 11/30/2016 
// Design Name: 
// Module Name:    Pass 
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
module Pass(
input			clk,
input			rst_n,
input	[3:0]	cur_state,
input			ref_sign,
input	[1:0]	refresh,
output	reg [5:0]	pass_message	// ‰≥ˆ–≈œ¢
    );
	 
parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100, PASS = 4'b0101;

reg	[5:0]	mes = 6'h0;


always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			mes <= 6'h0;
		else if(cur_state == PASS)
			if(ref_sign)
				begin
					case(refresh)
						3'h0:	mes <= 6'd28;	//◊÷ƒ∏S
						3'h1:	mes <= 6'd28;	//◊÷ƒ∏S
						3'h2:	mes <= 6'd10;	//◊÷ƒ∏A
						3'h3:	mes <= 6'd25;	//◊÷ƒ∏P
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
			pass_message <= 6'h0;
		else
			pass_message <= mes;
	end


endmodule
