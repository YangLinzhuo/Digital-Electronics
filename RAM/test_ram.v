`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:43:06 11/17/2016
// Design Name:   my_ram
// Module Name:   D:/Xilinx/workspace/RAM/test_ram.v
// Project Name:  RAM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: my_ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ram;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [5:0] addra;
	reg [31:0] dina;
	reg clkb;
	reg [5:0] addrb;

	// Outputs
	wire [31:0] doutb;

	// Instantiate the Unit Under Test (UUT)
	my_ram uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.clkb(clkb), 
		.addrb(addrb), 
		.doutb(doutb)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;
		clkb = 0;
		addrb = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

