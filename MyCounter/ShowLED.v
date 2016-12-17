`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:10 10/26/2016 
// Design Name: 
// Module Name:    ShowLED 
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
module ShowLED(
input						rst_n,
input 			[7:0]	cnt_data,
output	reg	[7:0]	light
);


always@(*)
begin
	if(~rst_n)
		light <= 8'h90;
	else
		light <= cnt_data;
end

endmodule
