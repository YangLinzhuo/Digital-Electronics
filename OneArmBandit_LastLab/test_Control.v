`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:36:21 11/28/2016
// Design Name:   Control
// Module Name:   D:/Xilinx/workspace/OneArmBandit_LastLab/test_Control.v
// Project Name:  OneArmBandit_LastLab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Control;

	// Inputs
	reg clk;
	reg rst_n;
	reg start_p;
	reg coin_p;

	// Outputs
	wire [3:0] cur_state;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start_p(start_p), 
		.coin_p(coin_p), 
		.cur_state(cur_state)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		start_p = 0;
		coin_p = 0;
		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
		
		#10;
		start_p = 1;
		#10;
		start_p = 0;
		
		#10;
		coin_p = 1;
		#10;
		coin_p = 0;
        
		// Add stimulus here

	end
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
	end
      
endmodule

