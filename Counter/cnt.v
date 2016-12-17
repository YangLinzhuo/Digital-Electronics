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
		if(cnt_type)	//����������
		begin
			if(cnt_data == 4'h9)	//������9�󣬴�0����
				cnt_data <= 4'h0;
			else
				cnt_data <= cnt_data + 4'h1;
		end
		else		//�ݼ�������
		begin
			if(cnt_data == 4'h0)	//������0�󣬴�9����
				cnt_data <= 4'h9;
			else
				cnt_data <= cnt_data - 4'h1;
		end
	end
end

endmodule
