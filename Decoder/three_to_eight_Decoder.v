`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:49 10/19/2016 
// Design Name: 
// Module Name:    three_to_eight_Decoder 
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
module three_to_eight_Decoder(
input						[2:0]		switch,			
output			reg	[7:0]		light
);

always@(switch)
begin
	case(switch)
		3'h0:				light = 8'b0000_0001;
		3'h1:				light = 8'b0000_0010;
		3'h2:				light = 8'b0000_0100;
		3'h3:				light = 8'b0000_1000;
		3'h4:				light = 8'b0001_0000;
		3'h5:				light = 8'b0010_0000;
		3'h6:				light	= 8'b0100_0000;
		3'h7:				light = 8'b1000_0000;
	endcase
end

endmodule
