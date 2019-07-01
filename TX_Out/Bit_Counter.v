`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:44 10/24/2018 
// Design Name: 
// Module Name:    Bit_Counter 
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
module Bit_Counter(clk, reset, BTU, DOIT, DONE );

input clk, reset, BTU, DOIT;
output DONE;

reg [3:0] D_Out, n_D_Out;

always @ (posedge clk, posedge reset)
begin
   
	if(reset)
	   D_Out <= 4'b0;
	else
	   D_Out <= n_D_Out;
		
end

always @ (*)
begin

   case( {DOIT,BTU} )
	      2'b00: n_D_Out <= 4'b0;
		   2'b01: n_D_Out <= 4'b0;
		   2'b10: n_D_Out <= D_Out;
		   2'b11: n_D_Out <= D_Out + 4'b1;
		 default: n_D_Out <= D_Out;
		endcase

end

assign DONE = (D_Out == 4'd11) ? 1'b1 : 1'b0;

endmodule
