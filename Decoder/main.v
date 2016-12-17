`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:02 10/19/2016 
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
input					[3:0]		switch,
output				[3:0]		select,
output				[7:0]		number,		//number[7:0] = {a, b, c, d, e, f, g, h}

output				[7:0]		light
);


Hex_Digital				u_hex(
.switch				(switch	),
.select				(select	),
.number				(number	)
);

three_to_eight_Decoder				u_dec(
.switch				(switch	),
.light				(light	)
);


endmodule
