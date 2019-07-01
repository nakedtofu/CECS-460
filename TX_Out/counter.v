`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <counter.v>                                        // 
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

module counter(clk, reset, ped, uhdl, count);
 //clock, reset, posedge detect, up high down low, count

   input             clk, reset, ped, uhdl; //uhdl slide switch
   output reg [15:0] count;
        
        always @ (posedge clk, posedge reset)
           if(reset)
              count <= 16'b0;
           else if(ped & uhdl)
              count <= count + 16'b1;
           else if(ped & ~uhdl)
              count <= count - 16'b1;

endmodule
