`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:46:07 12/01/2016
// Design Name:   Game
// Module Name:   D:/Xilinx/workspace/OneArmBandit_LastLab/testGame.v
// Project Name:  OneArmBandit_LastLab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Game
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testGame;

	// Inputs
	reg clk;
	reg rst_n;
	reg start_p;
	reg [3:0] cur_state;
	reg [1:0] refresh;
	reg ref_sign;
	reg [3:0] randNum;

	// Outputs
	wire [3:0] result;
	wire [3:0] number1;
	wire [3:0] number2;
	wire [3:0] number3;
	wire score_sign;
	wire turn_p;

	// Instantiate the Unit Under Test (UUT)
	Game uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start_p(start_p), 
		.cur_state(cur_state), 
		.refresh(refresh), 
		.ref_sign(ref_sign), 
		.randNum(randNum), 
		.result(result), 
		.number1(number1), 
		.number2(number2), 
		.number3(number3), 
		.score_sign(score_sign), 
		.turn_p(turn_p)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		start_p = 0;
		cur_state = 0;
		refresh = 0;
		ref_sign = 0;
		randNum = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst_n = 1;
		  cur_state = 4'b0001;
		// Add stimulus here

	end
      
	
	initial
		begin
			clk = 0;
			forever #1 clk = ~clk;
		end
endmodule

