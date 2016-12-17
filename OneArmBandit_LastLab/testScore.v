`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:08:34 11/30/2016
// Design Name:   Score
// Module Name:   D:/Xilinx/workspace/OneArmBandit_LastLab/testScore.v
// Project Name:  OneArmBandit_LastLab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Score
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testScore;

	// Inputs
	reg clk;
	reg rst_n;
	reg turn_p;
	reg ref_sign;
	reg [1:0] refresh;
	reg [3:0] number1;
	reg [3:0] number2;
	reg [3:0] number3;

	// Outputs
	wire [3:0] number;
	wire pass_p;

	// Instantiate the Unit Under Test (UUT)
	Score uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.turn_p(turn_p), 
		.ref_sign(ref_sign), 
		.refresh(refresh), 
		.number1(number1), 
		.number2(number2), 
		.number3(number3), 
		.number(number), 
		.pass_p(pass_p)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		turn_p = 0;
		ref_sign = 0;
		refresh = 0;
		number1 = 0;
		number2 = 0;
		number3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst_n = 1;
		#10;
		turn_p = 1;
        
		// Add stimulus here

	end
	
	initial
		begin
			clk = 0;
			forever #1 clk = ~clk;
		end
      
endmodule

