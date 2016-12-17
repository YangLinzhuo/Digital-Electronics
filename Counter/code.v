`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:18 10/08/2016 
// Design Name: 
// Module Name:    code 
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
module code(
input				[3:0]	cnt_data,
output 			[3:0]	sel,
output	reg	[7:0]	data	//data[7:0] = {a,b,c,d,e,f,g}
);

assign 	sel  =  4'b0111;

always@(*)
begin
	case(cnt_data)
		4'h0:		data		= 8'b0000_0011;		//���ڹ����������
		4'h1:		data		= 8'b1001_1111;		//�͵�ƽ��Ӧλ�ĵ���
		4'h2:		data		= 8'b0010_0101;		//�ߵ�ƽ��Ӧλ�ĵ���
		4'h3:		data		= 8'b0000_1101;
		4'h4:		data		= 8'b1001_1001;
		4'h5:		data		= 8'b0100_1001;
		4'h6:		data		= 8'b0100_0001;
		4'h7:		data		= 8'b0001_1111;
		4'h8:		data		= 8'b0000_0001;
		4'h9:		data		= 8'b0000_1001;
		default:	data		= 8'b1111_1111;
	endcase
end

endmodule
