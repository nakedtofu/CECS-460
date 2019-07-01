`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:44:55 11/26/2018
// Design Name:   top_level
// Module Name:   C:/Users/NAO/Desktop/CECS460/lab2/top_level_tb.v
// Project Name:  tramelblazetemp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_level_tb;

	// Inputs
	reg clk;
	reg resetmeta;
	reg Eight;
	reg Pen;
	reg OHEL;
	reg [3:0] baud_in;

	// Outputs
	wire [15:0] LED;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.clk(clk), 
		.resetmeta(resetmeta), 
		.Eight(Eight), 
		.Pen(Pen), 
		.OHEL(OHEL), 
		.baud_in(baud_in), 
		.LED(LED), 
		.tx(tx)
	);

   always #5 clk = ~clk;
	
	initial 
	begin
		
		// Initialize Inputs
		resetmeta = 1;
		OHEL = 0;
		Eight = 0;
		Pen = 0;
		clk = 0;
		baud_in = 4'hB;

		// Wait 1us for global reset to finish
		#100 resetmeta = 0;
       
		// Add stimulus here 

		
	end
	
endmodule

