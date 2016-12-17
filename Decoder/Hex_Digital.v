`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:42 10/19/2016 
// Design Name: 
// Module Name:    Hex_Digital 
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
module Hex_Digital(
input					[3:0]		switch,
output				[3:0]		select,
output		reg	[7:0]		number		//number[7:0] = {a, b, c, d, e, f, g, h}
);

assign	select = 4'b0111;

always@(switch)
begin
	case(switch)
		4'h0:				number = 8'b0000_0011;
		4'h1:				number = 8'b1001_1111;
		4'h2:				number = 8'b0010_0101;
		4'h3:				number = 8'b0000_1101;
		4'h4:				number = 8'b1001_1001;
		4'h5:				number = 8'b0100_1001;
		4'h6:				number = 8'b0100_0001;
		4'h7:				number = 8'b0001_1111;
		4'h8:				number = 8'b0000_0001;
		4'h9:				number = 8'b0000_1001;
		4'hA:				number = 8'b0001_0001;
		4'hB:				number = 8'b1100_0001;
		4'hC:				number = 8'b0110_0011;
		4'hD:				number = 8'b1000_0101;
		4'hE:				number = 8'b0110_0001;
		4'hF:				number = 8'b0111_0001;
	endcase
end

endmodule
