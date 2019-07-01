`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <ticker.v>                                         // 
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

module ticker(clk, reset, tick);

   input clk, reset;
	output wire tick;
	reg [16:0] count;
	reg [16:0] n_count;

	assign tick = (count == 100000);

	always @ (posedge clk, posedge reset)
	   if(reset)
		   count <= 17'b0;
		else 
		   count <= n_count;		
			
	always @ (*)
	   n_count = (tick) ? 17'b0 : count + 17'b1;

endmodule
