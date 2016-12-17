`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:11 10/08/2016 
// Design Name: 
// Module Name:    cnt 
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
module cnt(
input						clk,
input						rst_n,
input						cnt_en,
input						cnt_type,
output	reg	[3:0]	cnt_data
    );

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt_data <= 4'h5;
	else if(cnt_en)
	begin
		if(cnt_type)	//递增计数器
		begin
			if(cnt_data == 4'h9)	//计数到9后，从0继续
				cnt_data <= 4'h0;
			else
				cnt_data <= cnt_data + 4'h1;
		end
		else		//递减计数器
		begin
			if(cnt_data == 4'h0)	//计数到0后，从9继续
				cnt_data <= 4'h9;
			else
				cnt_data <= cnt_data - 4'h1;
		end
	end
end

endmodule
