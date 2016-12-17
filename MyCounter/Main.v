`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:01 10/26/2016 
// Design Name: 
// Module Name:    Main 
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
module Main(
input				clk,
input				rst_n,
input				pause,
output	[3:0]	sel,
output	[7:0]	data,
output	[7:0]	light
);


wire 				cnt_en;
wire		[7:0]	cnt_data;
wire				refresh;


Counter				u_Counter(
.clk				(clk		),
.rst_n			(rst_n	),
.cnt_en			(cnt_en	),
.pause			(pause	),
.cnt_data		(cnt_data)
);

ProducePulse				u_ProducePulse(
.clk				(clk			),
.rst_n			(rst_n		),
.cnt_en			(cnt_en		)
);

ShowDigitalNum				u_ShowDigitalNum(
.refresh			(refresh		),
.cnt_data		(cnt_data	),
.sel				(sel			),
.data				(data			)
);

ShowLED						u_ShowLED(
.rst_n			(rst_n		),
.cnt_data		(cnt_data	),
.light			(light		)
);

Refresh						u_Refresh(
.clk				(clk			),
.refresh			(refresh		)
);

endmodule
