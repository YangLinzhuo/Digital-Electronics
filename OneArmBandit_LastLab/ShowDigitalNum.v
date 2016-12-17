`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:24 11/28/2016 
// Design Name: 
// Module Name:    ShowDigitalNum 
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
module ShowDigitalNum(
input	clk,
input	rst_n,
input	[3:0]	cur_state,
input	[1:0] refresh,
input	[3:0]	coin_num,	//硬币数
input	[3:0]	result,
input	[3:0]	number,
input	[5:0] message,
input	[5:0] pass_message,
input	[5:0] lose_message,
input	[5:0]	wel_message,
output wire [3:0] position,	//选择点亮的数码管位置
output reg  [7:0] data		//输出的数码管点亮信息
    );

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100, PASS = 4'b0101, LOSE = 4'b0110;


reg [3:0] pos = 4'b1110;

reg [5:0] info  = 6'h0;

	
always@(posedge clk)
	begin
		case(cur_state)
			WELCOME:
				case(refresh)
					2'h0: pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
					2'h2: pos <= 4'b1011;
					2'h3: pos <= 4'b0111;
				endcase
			COIN:	pos <= 4'b1110;
			PASS:
				case(refresh)
					2'h0: pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
					2'h2: pos <= 4'b1011;
					2'h3: pos <= 4'b0111;
				endcase
			LOSE:
				case(refresh)
					2'h0: pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
					2'h2: pos <= 4'b1011;
					2'h3: pos <= 4'b0111;
				endcase
			ERROR:
				case(refresh)
					2'h0: pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
					2'h2: pos <= 4'b1011;
					2'h3: pos <= 4'b0111;
				endcase
			SCORE:
				case(refresh)
					2'h0:	pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
				endcase
			default: 
				case(refresh)
					2'h0:	pos <= 4'b1110;
					2'h1:	pos <= 4'b1101;
					2'h2:	pos <= 4'b1011;
				endcase
		endcase
	end


always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			info <= wel_message;
		else
			case(cur_state)
				GAME:	info <= result;
				COIN:	info <= coin_num;
				SCORE: info <= number;
				ERROR: info <= message;
				PASS: info <= pass_message;
				LOSE:	info <= lose_message;
				WELCOME: info <= wel_message;
				default:	info <= 4'h0;
			endcase
	end


always@(posedge clk)
	begin
		case(info)
			6'h0:	data <= 8'b00000011;
			6'h1:	data <= 8'b10011111;
			6'h2:	data <= 8'b00100101;
			6'h3:	data <= 8'b00001101;
			6'h4:	data <= 8'b10011001;
			6'h5:	data <= 8'b01001001;
			6'h6:	data <= 8'b01000001;
			6'h7:	data <= 8'b00011111;
			6'h8:	data <= 8'b00000001;
			6'h9: data <= 8'b00001001;
			6'hA: data <= 8'b00010001;
			6'hB: data <= 8'b11000001;
			6'hC: data <= 8'b01100011;
			6'hD: data <= 8'b10000101;
			6'hE: data <= 8'b01100001;
			6'hF: data <= 8'b01110001;
			6'd18:	data <= 8'b11110111;	//字母I
			6'd21:	data <= 8'b11100011; //字母L
			6'd22:	data <= 8'b01010101; //字母M
			6'd23:	data <= 8'b11010101; //字母N
			6'd24:	data <= 8'b11000101;	//字母O
			6'd25:	data <= 8'b00110001;	//字母P
			6'd28:	data <= 8'b01011001;	//字母S
			6'd32:	data <= 8'b01000111; //字母W
		endcase
	end

assign position = pos;

endmodule

