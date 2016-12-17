`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:12 10/13/2016 
// Design Name: 
// Module Name:    main 
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
module main(
    input 			[1:0] a,		//����a
    input 			[1:0] b,		//����b
    input 			[1:0] c,		//����c
    input 			[1:0] d,		//����d
	 input 			[1:0]	sel,	//����ѡ��sel
    output 	reg	[1:0] data		//���
    );

always@(sel or a or b or c or d)
begin
	case(sel)
		2'h0:				data = a;
		2'h1:				data = b;
		2'h2:				data = c;
		2'h3:				data = d;
	endcase
end

endmodule
