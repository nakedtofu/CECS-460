`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:39 10/02/2018 
// Design Name: 
// Module Name:    RS_Flop 
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
module RS_Flop(clk, reset, R, S, Q);

	//RS flop
	always @ (posedge clk, posedge reset)
	begin
	
	   if (reset)
		   Q <= 1'b0;
		else if(S)
		   Q <= 1'b1;
		else if(R)
		   Q <= 1'b0;
		else
		   Q <= Q;
	
	end

endmodule
