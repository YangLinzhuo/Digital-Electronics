`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:18:57 11/30/2016
// Design Name:   Score
// Module Name:   D:/Xilinx/workspace/OneArmBandit_LastLab/testScore_new.v
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

module testScore_new;

	// Inputs
	reg clk;
	reg rst_n;
	reg turn_p;
	reg ref_sign;
	reg [1:0] refresh;
	reg [3:0] number1;
	reg [3:0] number2;
	reg [3:0] number3;
	reg score_sign;

	// Outputs
	wire [3:0] number;
	wire pass_p;
	wire lose_p;

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
		.score_sign(score_sign), 
		.number(number), 
		.pass_p(pass_p), 
		.lose_p(lose_p)
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
		score_sign = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
        
		// Add stimulus here

	end
	
	initial 
		begin
			clk = 0;
			forever #1 clk = ~clk;
		end
      
endmodule

