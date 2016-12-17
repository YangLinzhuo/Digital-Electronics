`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:19 11/17/2016
// Design Name:   Fibonaci
// Module Name:   D:/Xilinx/workspace/RAM/test_Fibonaci.v
// Project Name:  RAM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fibonaci
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Fibonaci;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] s_dina;
	wire [31:0] s_doutb;
	wire [5:0]  s_adda;
	wire [5:0]  s_addb;
	wire 			s_wea;
	wire [2:0]  s_state;
	wire [31:0] result;
	wire [4:0]  s_count;

	// Instantiate the Unit Under Test (UUT)
	Fibonaci uut (
		.clk(clk), 
		.s_dina(s_dina),
		.s_doutb(s_doutb),
		.s_adda(s_adda),
		.s_addb(s_addb),
		.s_wea(s_wea),
		.s_state(s_state),
		.result(result),
		.s_count(s_count)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
      forever #1 clk = ~clk;  
		// Add stimulus here

	end
      
endmodule

