`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:47:33 11/03/2016
// Design Name:   State_Transfer
// Module Name:   D:/Xilinx/workspace/FiniteStateMachine/test3.v
// Project Name:  FiniteStateMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: State_Transfer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test3;

	// Inputs
	reg pulse_p;
	reg clk;
	reg rst_n;
	reg key;

	// Outputs
	wire result;
	wire res_en;

	// Instantiate the Unit Under Test (UUT)
	State_Transfer uut (
		.pulse_p(pulse_p), 
		.clk(clk), 
		.rst_n(rst_n), 
		.key(key), 
		.result(result), 
		.res_en(res_en)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		pulse_p = 0;
		key = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
		pulse_p = 1;
		key = 1;
		
		#200 key = 0;
		key = 1;
		// Add stimulus here
	end
	
	initial
	begin
		clk = 0;
		forever #1 clk = ~clk;
	end
endmodule

