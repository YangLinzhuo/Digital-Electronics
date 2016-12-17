`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:54:55 11/15/2016
// Design Name:   Register
// Module Name:   D:/Xilinx/workspace/Register/test.v
// Project Name:  Register
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register
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
	reg rst;
	reg write_enable;
	reg read_enable;
	reg [3:0] write_in_data;
	reg [1:0] write_in_address;
	reg [1:0] read_out_address;

	// Outputs
	wire [3:0] Led;

	// Instantiate the Unit Under Test (UUT)
	Register uut (
		.clk(clk), 
		.rst(rst), 
		.write_enable(write_enable), 
		.read_enable(read_enable), 
		.write_in_data(write_in_data), 
		.write_in_address(write_in_address), 
		.read_out_address(read_out_address), 
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		write_enable = 0;
		read_enable = 0;
		write_in_data = 0;
		write_in_address = 0;
		read_out_address = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 0;
		read_enable = 1;
		write_enable = 1;
		write_in_data = 1;
		write_in_address = 1;
		read_out_address = 0;
		
		
		#100;
		write_in_data = 4'b1111;
		write_in_address = 2;
		read_out_address = 2;
		
		// Add stimulus here

	end
	
	initial begin
	clk = 0;
	forever #1 clk = ~clk;
	end
      
endmodule

