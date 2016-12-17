`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:24:58 10/27/2016
// Design Name:   Main
// Module Name:   D:/Xilinx/workspace/MyCounter/Simulation.v
// Project Name:  MyCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Simulation;

	// Inputs
	reg clk;
	reg rst_n;
	reg pause;

	// Outputs
	wire [3:0] sel;
	wire [7:0] data;
	wire [7:0] light;


	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.pause(pause),
		.clk(clk), 
		.rst_n(rst_n), 
		.sel(sel), 
		.data(data), 
		.light(light)
	);
	

	initial begin
		// Initialize Inputs
		clk = 1;
		rst_n = 0;
		pause = 0;
		// Wait 100 ns for global reset to finish
		#100 rst_n = 1;
		// Add stimulus here
	end
	
	initial begin
	forever	#1 clk = ~clk;
	end
		

endmodule

