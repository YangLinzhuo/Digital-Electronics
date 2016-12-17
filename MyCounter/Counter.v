`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:21 10/26/2016 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
input						clk,		//ʱ���ź�
input						rst_n,	//��λ�ź�
input						cnt_en,	//ʹ���ź�
input						pause,	//��ͣ�ź�
output	reg	[7:0]	cnt_data
    );


always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt_data <= 8'h90;
	else if(~cnt_en || pause)
		cnt_data <= cnt_data;	//��ͣ����
	else if(cnt_en)
	begin
		if(cnt_data == 8'h99)
			cnt_data <= 8'h0;
		else if({cnt_data[3],cnt_data[2],cnt_data[1],cnt_data[0]} == 4'h9)
			cnt_data <= (cnt_data & 8'hF0) + 8'h10;
		else
			cnt_data <= cnt_data + 4'h1;
	end
end

endmodule
