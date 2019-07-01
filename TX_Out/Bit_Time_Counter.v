`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:03:09 10/29/2018 
// Design Name: 
// Module Name:    Bit_Time_Counter 
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
module Bit_Time_Counter( clk, reset, DOIT, BAUD, BTU );

input         clk, reset, DOIT;
input  [18:0] BAUD;
output        BTU;

reg [18:0] D_Out, n_D_Out;

always @ (posedge clk, posedge reset)
begin

   if(reset)
	   D_Out <= 19'b0;
	else
	   D_Out <= n_D_Out;

end

always @ (*)
begin

   case( {DOIT,BTU} )
      2'b00: n_D_Out <= 19'b0;
	   2'b01: n_D_Out <= 19'b0;
	   2'b10: n_D_Out <= D_Out + 19'b1;
	   2'b11: n_D_Out <= 19'b0;
	default : n_D_Out <= D_Out;
	endcase

end

assign BTU = (D_Out == BAUD) ? 1'b1 : 1'b0;

endmodule
