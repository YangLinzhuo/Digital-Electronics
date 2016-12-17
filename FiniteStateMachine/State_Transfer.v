`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:28:11 11/03/2016 
// Design Name: 
// Module Name:    State_Transfer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module State_Transfer(
input					pulse_p,
input					clk,
input					rst_n,
input					key,
output	reg		result
    );
	 
reg	[1:0]	cur_state = 2'b00;
reg	[1:0]	next_state = 2'b00;

parameter  S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

always@(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			cur_state <= S0;
		else
			cur_state <= next_state;
	end

always@(key or cur_state or pulse_p)
	begin
		if(pulse_p)
			begin
			case(cur_state)
				S0:
					begin
						next_state = key ? S1 : S0;
						//result = 0;	
					end
				S1:
					begin
						next_state = key ? S2 : S0;
						//result = 0;
					end
				S2:
					begin
						next_state = key ? S2 : S3;
						//result = 0;
					end
				S3:
					begin
						next_state = S0;
						//result = key ? 1 : 0;
					end
				default:	
					begin
						next_state = S0;
						//result = 0;
					end
				endcase
			end
		else
			next_state = cur_state;
	end

always@(key or next_state or pulse_p)
	begin
		if(next_state == S3)
			result = key ? 1 : 0;
		else
			result = 1'h0;
	end

endmodule
