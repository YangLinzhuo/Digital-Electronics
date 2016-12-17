`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:06 10/08/2016 
// Design Name: 
// Module Name:    top 
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
module top(
input				clk,
input				rst_n,
input				cnt_type,
output	[3:0]	sel,
output	[7:0]	data
);


wire 				cnt_en;
wire		[3:0]	cnt_data;

div				u_div(
.clk				(clk		),
.rst_n			(rst_n	),
.cnt_en			(cnt_en	)
);

cnt				u_cnt(
.clk				(clk			),
.rst_n			(rst_n		),
.cnt_en			(cnt_en		),
.cnt_type		(cnt_type	),
.cnt_data		(cnt_data	)
);

code				u_code(
.cnt_data		(cnt_data	),
.sel				(sel			),
.data				(data			)
);

endmodule