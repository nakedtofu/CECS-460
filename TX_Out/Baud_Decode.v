`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:07:42 10/29/2018 
// Design Name: 
// Module Name:    Baud_Decode 
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
module Baud_Decode( Baud, Baud_Out );

input   [3:0] Baud;
output [18:0] Baud_Out;

assign Baud_Out = (Baud == 4'h0) ? 19'd333333 : //300
                  (Baud == 4'h1) ?  19'd83333 : //1200
						(Baud == 4'h2) ?  19'd41667 : //2400
                  (Baud == 4'h3) ?  19'd20833 : //4800
						(Baud == 4'h4) ?  19'd10417 : //9600
                  (Baud == 4'h5) ?   19'd5208 : //19200
						(Baud == 4'h6) ?   19'd2604 : //38400
                  (Baud == 4'h7) ?   19'd1736 : //57600
						(Baud == 4'h8) ?    19'd868 : //115200
                  (Baud == 4'h9) ?    19'd434 : //230400
						(Baud == 4'hA) ?    19'd217 : //460800
                  (Baud == 4'hB) ?    19'd109 : //921600
						                      19'd0;

endmodule
