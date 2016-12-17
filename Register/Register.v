`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:58 11/09/2016 
// Design Name: 
// Module Name:    Register 
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
module Register(
input						clk,
input						rst,
input						write_enable,		//写使能，低电平可写入
input						read_enable,
input			 [3:0]	write_in_data,
input		 	 [1:0]	write_in_address,
input		 	 [1:0]	read_out_address,
output	reg [3:0]	Led
    );

reg [3:0]	data0;
reg [3:0]	data1;
reg [3:0]	data2;
reg [3:0]	data3;

always@(posedge clk or posedge rst)
	begin
		if(rst)			
			begin
				data0 <= 4'h1;
				data1 <= 4'h2;
				data2 <= 4'h4;
				data3 <= 4'h8;
			end
		else if(write_enable)
			begin
				case(write_in_address)
					2'h0:		data0 <= write_in_data;
					2'h1:		data1 <= write_in_data;
					2'h2:		data2 <= write_in_data;
					2'h3:		data3 <= write_in_data;
				endcase
			end
		else
			begin
				data0 <= data0;
				data1 <= data1;
				data2 <= data2;
				data3 <= data3;
			end
	end


always@(posedge clk or posedge rst)
	begin
		if(rst)
			Led <= 4'h0;
		else if(read_enable)
			begin
				case(read_out_address)
					2'h0:		Led<= data0;
					2'h1:		Led<= data1;
					2'h2:		Led <= data2;
					2'h3:		Led <= data3;
				endcase
			end
		else
			Led <= Led;
	end

endmodule
