`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:52 11/03/2016 
// Design Name: 
// Module Name:    FSM_Main 
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
module FSM_Main(
input				clk,
input				rst_n,
input				key,
input				button,
output	[7:0]	Led,
output	[3:0]	sel,
output	[7:0]	data
    );

wire	result;
wire	pulse_p;


Remove_Jitter		u_RJ(
.clk			(clk	 ),
.rst_n		(rst_n ),
.button		(button),
.pulse_p		(pulse_p)
);

State_Transfer		u_ST(
.clk			(clk	 ),
.rst_n		(rst_n ),
.result		(result),
.pulse_p		(pulse_p),
.key			(key	 )
);


Show_LED		u_LED(
.clk			(clk	),
.rst_n		(rst_n),
.result		(result),
.pulse_p		(pulse_p),
.Led			(Led	)
);


Show_Digital u_Digital(
.clk			(clk	 ),
.rst_n		(rst_n ),
.key			(key	 ),
.pulse_p		(pulse_p),
.sel			(sel	 ),
.data			(data	 )
);

endmodule
