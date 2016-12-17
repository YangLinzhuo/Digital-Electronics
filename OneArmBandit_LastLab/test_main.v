`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:05:30 11/28/2016
// Design Name:   Main
// Module Name:   D:/Xilinx/workspace/OneArmBandit_LastLab/test_main.v
// Project Name:  OneArmBandit_LastLab
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

module test_main;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
	reg rand_en;
	reg select;
	reg coin;

	// Outputs
	wire [3:0] position;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.rand_en(rand_en), 
		.select(select), 
		.coin(coin), 
		.position(position), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		rst_n = 0;
		start = 0;
		rand_en = 0;
		select = 0;
		coin = 0;

		// Wait 100 ns for global reset to finish
		#200;
		rst_n = 1;
		rand_en = 1;
		
		#200;
		coin = 1;
		
		#200;
		coin = 0;
		
		#200;
		start = 1;
		
		#200;
		start = 0;
	
		// Add stimulus here

	end
	
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
	end
      
endmodule

