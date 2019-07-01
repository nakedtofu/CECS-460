`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <AISO.v>                                           // 
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

module AISO(clk, resetmeta, resetout);

   input clk, resetmeta;
	output reg resetout;
	wire qmeta, resetok;
			
	reg_1bit regMeta(.clk(clk), .reset(resetmeta), .d(1'b1), .q(qmeta)),
	         regOk(.clk(clk), .reset(resetmeta), .d(qmeta), .q(resetok));		
	
   always @ (*)
	   resetout = ~resetok;

endmodule
