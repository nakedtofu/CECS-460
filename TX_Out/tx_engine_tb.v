`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:53:52 11/14/2018
// Design Name:   TX_Engine
// Module Name:   C:/Users/NAO/Desktop/CECS460/lab2/tx_engine_tb.v
// Project Name:  tramelblazetemp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TX_Engine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tx_engine_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] port_id;
	reg write_strobe;
	reg [3:0] baud_in;
	reg [7:0] out_port;
	reg Eight;
	reg Pen;
	reg OHEL;

	// Outputs
	wire tx_rdy;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	TX_Engine uut (
		.clk(clk), 
		.reset(reset), 
		.port_id(port_id), 
		.write_strobe(write_strobe), 
		.baud_in(baud_in), 
		.out_port(out_port), 
		.Eight(Eight), 
		.Pen(Pen), 
		.OHEL(OHEL), 
		.tx_rdy(tx_rdy), 
		.tx(tx)
	);
	
	always #5 clk = ~clk;
	
	always #500 write_strobe = ~write_strobe;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		port_id = 0;
		write_strobe = 0;
		baud_in = 0;
		out_port = 8'h31;
		Eight = 0;
		Pen = 0;
		OHEL = 0;

		// Wait 100 ns for global reset to finish
		#100 reset = 0; 
		
		// Add stimulus here		

	end
      
endmodule

