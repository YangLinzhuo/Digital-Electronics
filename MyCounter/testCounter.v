`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:27 10/27/2016
// Design Name:   Counter
// Module Name:   D:/Xilinx/workspace/MyCounter/testCounter.v
// Project Name:  MyCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testCounter;

	// Inputs
	reg clk;
	reg rst_n;
	reg cnt_en;
	reg pause;

	// Outputs
	wire [7:0] cnt_data;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.cnt_en(cnt_en), 
		.pause(pause), 
		.cnt_data(cnt_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		cnt_en = 1;
		pause = 0;
		// Wait 100 ns for global reset to finish
       #100	rst_n	= 1;
		// Add stimulus here
		forever
		begin
			#1	clk <= ~clk;
		end
	end
      
endmodule

