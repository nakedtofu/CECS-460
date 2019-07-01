`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <pulse_maker.v>                                    // 
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

module pulse_maker(clk, reset, d, ped);

   input clk, reset, d;
	output reg ped;
	wire q1, q2;

   reg_1bit rA(.clk(clk), .reset(reset), .d(d), .q(q1)),
	         rB(.clk(clk), .reset(reset), .d(q1), .q(q2));
		 
	always @ (*)
	   ped = q1 & ~q2;

endmodule
