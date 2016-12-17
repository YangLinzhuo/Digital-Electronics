`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:52:58 11/03/2016 
// Design Name: 
// Module Name:    Show_Digital 
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
module Show_Digital(
input					clk,
input					rst_n,
input					key,
input					pulse_p,
output reg [3:0]  sel,
output reg [7:0]	data
    );

reg	[15:0]	count = 16'h0;
reg	[1:0]		choose = 2'h0;	 
reg	[3:0]		save = 4'h0;
reg				out_num = 1'h0;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			count <= 16'h0;
		else if(count == /*16'd10)*/16'd49_999)
			count <= 16'h0;
		else
			count <= count + 1'h1;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			save <= 4'h0;
		else if(pulse_p)
			save <= {save[2:0],key};
		else
			save <= save;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			sel <= 4'b0000;
		else if(count == /*16'd10)*/16'd49_999)
			begin
				case(choose)
					4'h0:		sel <= 4'b1110;
					4'h1:		sel <= 4'b1101;
					4'h2:		sel <= 4'b1011;
					4'h3:		sel <= 4'b0111;
					default:	sel <= 4'b1111;
				endcase
				if(choose == 4'h3)
					choose <= 4'h0;
				else
					choose <= choose + 4'h1;
			end
		else
			sel <= sel; 
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			out_num <= 1'h0;
		else if(count == /*16'd10)*/16'd49_999)
			out_num <= save[choose];
		else
			out_num <= out_num;
	end

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			data <= 8'b0000_0011;
		else if(count == /*16'd10)*/16'd49_999)
			begin
				case(out_num)
					1'h0:			data <= 8'b0000_0011;
					1'h1:			data <= 8'b1001_1111;
					default:		data <= 8'b1111_1111;
				endcase
			end
		else
			data <= data;
	end

endmodule
