`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:47:22 11/03/2016
// Design Name:   FSM_Main
// Module Name:   D:/Xilinx/workspace/FiniteStateMachine/test.v
// Project Name:  FiniteStateMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clk;
	reg rst_n;
	reg key;
	reg button;

	// Outputs
	wire [7:0] Led;
	wire [3:0] sel;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	FSM_Main uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.key(key), 
		.button(button), 
		.Led(Led), 
		.sel(sel), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		key = 0;
		button = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_n = 1;
		// Add stimulus here
		#100 key = 1;
	end
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
      end
endmodule

