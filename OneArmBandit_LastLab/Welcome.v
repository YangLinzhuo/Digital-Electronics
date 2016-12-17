`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:36 12/01/2016 
// Design Name: 
// Module Name:    Welcome 
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
module Welcome(
input		clk,
input	[3:0] cur_state,
input	[1:0] refresh,
input			ref_sign,
output	reg [5:0]	wel_message,
output	reg [7:0]	Led
	 );

parameter WELCOME = 4'b0000, GAME = 4'b0001, SCORE = 4'b0010, ERROR = 4'b0011, COIN = 4'b0100;

reg	[25:0] cnt = 26'h0;	//¼ÆÊ±
reg	[25:0] cnt2 = 26'h0;	//¼ÆÊ±
reg	[2:0]  count = 3'h0; //¼ÆÊý
reg	[5:0]	 mes = 6'h0;
reg	[7:0]	 light = 8'h0;

reg	[5:0]  alphaE = 6'd14;//×ÖÄ¸E
reg	[5:0]	 alphaM = 6'd22;//×ÖÄ¸M
reg	[5:0]	 alphaO = 6'd24;//×ÖÄ¸O
reg	[5:0]	 alphaC = 6'd12;//×ÖÄ¸C
reg	[5:0]	 alphaL = 6'd21;//×ÖÄ¸L
reg	[5:0]	 alphaW = 6'd32;//×ÖÄ¸W

always@(posedge clk)
	begin
		alphaE <= 6'd14;//×ÖÄ¸E
		alphaM <= 6'd22;//×ÖÄ¸M
		alphaO <= 6'd24;//×ÖÄ¸O
		alphaC <= 6'd12;//×ÖÄ¸C
		alphaL <= 6'd21;//×ÖÄ¸L
		alphaW <= 6'd32;//×ÖÄ¸W
	end

always@(posedge clk)
	begin
		if(cur_state != WELCOME)
			cnt <= 26'h0;
		else if(cnt == 26'd99_999_999)
			cnt <= 26'h0;
		else
			cnt <= cnt + 26'h1;
	end

always@(posedge clk)
	begin
		if(cur_state != WELCOME)
			count <= 3'h0;
		else if(cnt == 26'd99_999_999)
			if(count == 3'h6)
				count <= 3'h0;
			else
				count <= count + 3'h1;
		else
			count <= count;
	end
	

always@(posedge clk)
	begin
		if(cur_state != WELCOME)
			mes <= 6'h0;
		else if(cur_state == WELCOME)
			if(ref_sign)
			begin
				case(count)
					3'h0: 
						case(refresh)
							2'h0: mes <= alphaC;
							2'h1: mes <= alphaL;
							2'h2: mes <= alphaE;
							2'h3: mes <= alphaW;
						endcase
					3'h1:	
						case(refresh)
							2'h0: mes <= alphaO;
							2'h1: mes <= alphaC;
							2'h2: mes <= alphaL;
							2'h3: mes <= alphaE;
						endcase
					3'h2: 
						case(refresh)
							2'h0: mes <= alphaM;
							2'h1: mes <= alphaO;
							2'h2: mes <= alphaC;
							2'h3: mes <= alphaL;
						endcase
					3'h3:	
						case(refresh)
							2'h0: mes <= alphaE;
							2'h1: mes <= alphaM;
							2'h2: mes <= alphaO;
							2'h3: mes <= alphaC;
						endcase
					3'h4: 
						case(refresh)
							2'h0: mes <= alphaW;
							2'h1: mes <= alphaE;
							2'h2: mes <= alphaM;
							2'h3: mes <= alphaO;
						endcase
					3'h5: 
						case(refresh)
							2'h0: mes <= alphaE;
							2'h1: mes <= alphaW;
							2'h2: mes <= alphaE;
							2'h3: mes <= alphaM;
						endcase
					3'h6: 
						case(refresh)
							2'h0: mes <= alphaL;
							2'h1: mes <= alphaE;
							2'h2: mes <= alphaW;
							2'h3: mes <= alphaE;
						endcase
				endcase
			end
		else
			mes <= mes;
	end

always@(posedge clk)
	begin
		wel_message <= mes;
	end


always@(posedge clk)
	begin
		if(cur_state != WELCOME)
			cnt2 <= 26'h0;
		else if(cnt2 == 26'd9_999_999)
			cnt2 <= 26'h0;
		else
			cnt2 <= cnt2 + 26'h1;	
	end

always@(posedge clk)
	begin
		if(cur_state != WELCOME)
			light <= 8'h0;
		else if(cnt2 == 26'd9_999_999)
			light <= ~light;
		else
			light <= light;
	end

always@(posedge clk)
	begin
		Led <= light;
	end
	

endmodule
