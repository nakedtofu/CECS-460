`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:20 10/24/2018 
// Design Name: 
// Module Name:    shift_register 
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
module shift_register(clk, reset, Load, SH, SDI, Data, SDO);

input      clk, reset, Load, SH, SDI;
input      [10:0] Data;
output reg SDO;

reg [10:0] SR;

always @ (posedge clk, posedge reset)
begin

   if(reset)
	begin
	   SDO <= 1'b1;
	   SR <= 11'b111_1111_1111;
   end
   
	else if(Load)	
   begin
	   SDO <= SDO;
      SR <= Data;
   end		
	
	else if(SH)
	begin
	   SDO <= SR[0];
		SR <= { SDI, SR[10:1] };
	end
	
	else
	begin
	   SDO <= SDO;
		SR <= SR;
	end

end

endmodule
