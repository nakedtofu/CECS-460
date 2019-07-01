`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:20 10/29/2018 
// Design Name: 
// Module Name:    SD_Decode 
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
module SD_Decode( Eight, PEN, OHEL, Din, Decode_Out );
input        Eight, PEN, OHEL;
input  [7:0] Din;
output [1:0] Decode_Out;

assign Decode_Out = ( {Eight, PEN, OHEL} == 3'b000 ) ? 2'b11: 
             ( {Eight, PEN, OHEL} == 3'b001 ) ? 2'b11:
             ( {Eight, PEN, OHEL} == 3'b010 ) ? { 1'b1, ^Din[6:0] }:
             ( {Eight, PEN, OHEL} == 3'b011 ) ? { 1'b1, ~^Din[6:0] }:
             ( {Eight, PEN, OHEL} == 3'b100 ) ? { 1'b1, Din[7] }:
             ( {Eight, PEN, OHEL} == 3'b101 ) ? { 1'b1, Din[7] }:
				 ( {Eight, PEN, OHEL} == 3'b110 ) ? { ^Din[7:0], Din[7] }:
				 //( {Eight, PEN, OHEL} == 3'b111 ) ? 
				                                    { ~^Din[7:0], Din[7] };
	
endmodule
