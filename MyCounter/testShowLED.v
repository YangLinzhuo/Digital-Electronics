`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:04:35 10/28/2016
// Design Name:   ShowLED
// Module Name:   D:/Xilinx/workspace/MyCounter/testShowLED.v
// Project Name:  MyCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShowLED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testShowLED;

	// Inputs
	reg [7:0] cnt_data;

	// Outputs
	wire [7:0] light;

	// Instantiate the Unit Under Test (UUT)
	ShowLED uut (
		.cnt_data(cnt_data), 
		.light(light)
	);

	initial begin
		// Initialize Inputs
		cnt_data = 8'h0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever #2500 cnt_data <= cnt_data + 8'h1;
	end
      
endmodule

