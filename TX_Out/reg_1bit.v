`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <reg_1bit.v>                                       // 
//                                                                // 
//  Created by Naoaki Takatsu on 02/12/2018.                      // 
//  Copyright © 2018                                              //
//  Naoaki Takatsu. All rights reserved.                          // 
//                                                                // 
//                                                                // 
//  In submitting this file for class work at CSULB               // 
//  I am confirming that this is my work and the work             // 
//  of no one else. In submitting this code I acknowledge that    // 
//  plagiarism in student project work is subject to dismissal.   //  
//  from the class                                                // 
//****************************************************************//

module reg_1bit(clk, reset, d, q);

   input clk, reset, d;
	output reg q;
	
	always @ (posedge clk, posedge reset)
	   if(reset)
		   q <= 1'b0;
		else
		   q <= d;

endmodule
