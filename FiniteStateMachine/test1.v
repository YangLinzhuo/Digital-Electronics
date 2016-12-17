`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:51:28 11/03/2016
// Design Name:   Show_Digital
// Module Name:   D:/Xilinx/workspace/FiniteStateMachine/test1.v
// Project Name:  FiniteStateMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Show_Digital
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg clk;
	reg rst_n;
	reg key;
	reg res_en;

	// Outputs
	wire [3:0] sel;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	Show_Digital uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.key(key), 
		.res_en(res_en), 
		.sel(sel), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		key = 0;
		res_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_n = 1;
		res_en = 1;
		// Add stimulus here
		#10 key = 1;
		#10 res_en = 0;
		#10 res_en = 1;
		#10 key = 1;
		#10 res_en = 0;
		#10 res_en = 1;
		#10 key = 0;
		#10 res_en = 0;
		#10 res_en = 1;
		#10 key = 1;
		#10 res_en = 0;
	end
      
	initial
		begin
			clk = 0;
			forever #1 clk = ~clk;
		end
endmodule

