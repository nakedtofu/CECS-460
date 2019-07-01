`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:15 10/02/2018
// Design Name:   tramelblaze_top
// Module Name:   C:/Users/NAO/Desktop/CECS460/tramelblazetemp/tramelblaze_top_sim.v
// Project Name:  tramelblazetemp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tramelblaze_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tramelblaze_top_sim;

	// Inputs
	reg CLK;
	reg RESET;
	reg [15:0] IN_PORT;
	reg INTERRUPT;

	// Outputs
	wire [15:0] OUT_PORT;
	wire [15:0] PORT_ID;
	wire READ_STROBE;
	wire WRITE_STROBE;
	wire INTERRUPT_ACK;

	// Instantiate the Unit Under Test (UUT)
	tramelblaze_top uut (
		.CLK(CLK), 
		.RESET(RESET), 
		.IN_PORT(IN_PORT), 
		.INTERRUPT(INTERRUPT), 
		.OUT_PORT(OUT_PORT), 
		.PORT_ID(PORT_ID), 
		.READ_STROBE(READ_STROBE), 
		.WRITE_STROBE(WRITE_STROBE), 
		.INTERRUPT_ACK(INTERRUPT_ACK)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 0;
		IN_PORT = 0;
		INTERRUPT = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

