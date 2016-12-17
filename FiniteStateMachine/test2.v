`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:41:38 11/03/2016
// Design Name:   Remove_Jitter
// Module Name:   D:/Xilinx/workspace/FiniteStateMachine/test2.v
// Project Name:  FiniteStateMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Remove_Jitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test2;

	// Inputs
	reg clk;
	reg rst_n;
	reg button;

	// Outputs
	wire pulse_p;

	// Instantiate the Unit Under Test (UUT)
	Remove_Jitter uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.button(button), 
		.pulse_p(pulse_p)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		button = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_n = 1;
		button = 1;
		// Add stimulus here

	end
	
	initial
	begin
		clk = 0;
		forever #1 clk = ~clk; 
	end
      
endmodule

