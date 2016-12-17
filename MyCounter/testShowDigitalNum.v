`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:58:17 10/28/2016
// Design Name:   ShowDigitalNum
// Module Name:   D:/Xilinx/workspace/MyCounter/testShowDigitalNum.v
// Project Name:  MyCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShowDigitalNum
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testShowDigitalNum;

	// Inputs
	reg refresh;
	reg [7:0] cnt_data;

	// Outputs
	wire [3:0] sel;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	ShowDigitalNum uut (
		.refresh(refresh), 
		.cnt_data(cnt_data), 
		.sel(sel), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		refresh = 0;
		cnt_data = 8'h0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever
		begin
			#1 refresh <= ~refresh;
			#25000	cnt_data <= cnt_data + 8'h1;
		end
	end
      
endmodule

