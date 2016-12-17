`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:26:43 10/13/2016
// Design Name:   main
// Module Name:   D:/Xilinx/workspace/Four_Bit/test.v
// Project Name:  Four_Bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
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
	reg [1:0] a;
	reg [1:0] b;
	reg [1:0] c;
	reg [1:0] d;
	reg [1:0] sel;

	// Outputs
	wire [1:0] data;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.sel(sel), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		a = 2'b00;
		b = 2'b10;
		c = 2'b01;
		d = 2'b11;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 2'b00;
		#100;
		sel = 2'b01;
		#100;
		sel = 2'b10;
		#100;
		sel = 2'b11;
	end
      
endmodule

