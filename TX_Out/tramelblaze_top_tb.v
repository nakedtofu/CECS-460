`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:15:14 09/12/2018
// Design Name:   tramelblaze_top
// Module Name:   C:/Users/NAO/Desktop/CECS460/tb_start/tramelblaze_top_tb.v
// Project Name:  tb_start
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

module tramelblaze_top_tb;

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

   always #5 CLK = ~CLK;
	
	initial
	begin
	
	   CLK = 0;
		IN_PORT = 0;
		INTERRUPT = 0;
		RESET = 1;
		#100
		RESET = 0;
		
		repeat (10)
		begin
		
		   #1000
			@(posedge CLK)
			INTERRUPT = 1;
			@(posedge INTERRUPT_ACK)
			INTERRUPT = 0;
			
		end
			
   end

endmodule

