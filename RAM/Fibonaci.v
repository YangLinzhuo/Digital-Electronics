`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:49:16 11/16/2016 
// Design Name: 
// Module Name:    Fibonaci 
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
//synthesis attribute box_type <my_ram> "black_box"
module Fibonaci(
input	clk,
output reg [31:0] result, 
output reg [31:0] s_dina,
output reg [31:0] s_doutb,
output reg        s_wea,
output reg [5:0]  s_adda,
output reg [5:0]  s_addb,
output reg [2:0]  s_state,
output reg [4:0]  s_count
 );


parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
reg [2:0] cur_state = S0;
reg [2:0] next_state = S1;
reg [4:0] count = 5'h0;
//reg [31:0] data = 32'h0;
//reg [4:0] Aaddr = 5'h0;
//reg [4:0] Baddr = 5'h0;
reg [4:0] addra = 5'h0;
reg [4:0] addrb = 5'h0;
reg [31:0] dina = 32'h0;
reg wea = 1'h0;
wire [31:0] doutb;


always@(posedge clk)
	begin
		cur_state <= next_state;
	end

always@(posedge clk)
	begin
		if(cur_state == S0)
			count <= 5'h0;
		else if(count == 5'd29)
			count <= count;
		else if(cur_state == S3)
			count <= count + 5'h1;
		else
			count <= count;
	end

always@(posedge clk)
	begin
		case(next_state)
			S0: next_state <= S1;
			S1: next_state <= S2;
			S2: next_state <= S3;
			S3: next_state <= S4;
			S4: 
				begin
					if(count == 5'd29)
						next_state <= S5;
					else
						next_state <= S1;
				end
			S5: next_state <= S5;
		endcase
	end
/*	
always@(posedge clk)
	begin
		case(cur_state)
			S0: cur_state <= S1; //next_state <= S1;
			S1: cur_state <= S2; //next_state <= S2;
			S2: cur_state <= S3; //next_state <= S3;
			S3: cur_state <= S4; //next_state <= S4;
			S4: 
				begin
					if(count == 5'd30)
						cur_state <= S5; //next_state <= S5;
					else
						cur_state <= S1; //next_state <= S1;
				end
			S5: cur_state <= S5; //next_state <= S5;
		endcase
	end
*/
always@(posedge clk)
	begin
		if(cur_state == S0)
			dina <= 32'h0; //data <= 32'h0;
		else if(cur_state == S1)
			dina <= doutb; //data <= doutb;
		else if(cur_state == S3)
			dina <= dina + doutb; //data <= data + doutb;
		else
			dina <= dina; //data <= data;
	end

always@(posedge clk)
	begin
		if(cur_state == S0)
			addra <= 5'h1; //Aaddr <= 5'h1;
		else if(cur_state == S3)
			addra <= addra + 5'h1; //Aaddr <= Aaddr + 5'h1;
		else if(addra == 5'd31)
			addra <= addra; //Aaddr <= Aaddr;
		else if(cur_state == S5)
			addra <= addra; //Aaddr <= Aaddr;
		else
			addra <= addra;
	end

always@(posedge clk)
	begin
		if(cur_state == S0)
			addrb <= 5'h0; //Baddr <= 5'h0;
		else if(cur_state == S1)
			addrb <= addrb + 5'h1;
		else if(cur_state == S3)
			addrb <= addrb; //Baddr <= Baddr + 5'h1;
		else if(cur_state == S5)
			addrb <= addrb; //Baddr <= Baddr;
		else
			addrb <= addrb;
	end

always@(posedge clk)
	begin
		if(cur_state == S4)
			wea <= 1;
		else
			wea <= 0;
	end
/*
always@(posedge clk)
	begin
		addra <= Aaddr;
		addrb <= Baddr;
		dina <= data;
		wea <= cur_state[2] && ~cur_state[1] && ~cur_state[0];
	end
*/
/*
always@(posedge clk)
	begin
		if(cur_state == S0)
			result <= 32'h0;
		else if(cur_state == S1 || cur_state == S3)
			result <= doutb;
		else
			result <= result;
	end
*/

always@(posedge clk)
	begin
		s_dina <= dina;
		s_doutb <= doutb;
		s_adda <= addra;
		s_addb <= addrb;
		s_wea <= wea;
		s_state <= cur_state;
		result <= doutb;
		s_count <= count;
	end

my_ram	ram(
.clka(clk),
.clkb(clk),
.doutb(doutb),
.dina(dina),
.wea(wea),
.addra(addra),
.addrb(addrb)
);

endmodule
