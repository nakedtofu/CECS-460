`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <debounce_2.v>                                     // 
//                                                                // 
//  Created by Naoaki Takatsu on 02/21/2018.                      // 
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

module debounce_2(
   input clk, reset,
	input tick,
   input SW,
   output reg db
   );

   localparam [2:0] zero = 3'b000,
	                 wait1_1 = 3'b001,
						  wait1_2 = 3'b010,
						  wait1_3 = 3'b011,
						  one = 3'b100,
						  wait0_1 = 3'b101,
						  wait0_2 = 3'b110,
						  wait0_3 = 3'b111;

   localparam N = 20;
   reg  [N-1:0] p_out;
   wire [N-1:0] n_out;
   reg    [2:0] p_state, n_state;
	
   always @ (posedge clk)
      p_out <= n_out;
      assign n_out = p_out + 1'b1;

   always @ (posedge clk, posedge reset)
      if (reset)
         p_state <= zero;
		else
         p_state <= n_state;
			
   always @(*)
   begin
      
		n_state = p_state;
      db = 1'b0;
      
		case(p_state)
		
         zero:
            if(SW)
               n_state = wait1_1;
					
         wait1_1:
            if(~SW)
               n_state = zero;
            else
               if(tick)
                  n_state = wait1_2;
						
         wait1_2:
            if(~SW)
               n_state = zero;
            else
               if (tick)
                  n_state = wait1_3;
						
         wait1_3:
            if (~SW)
               n_state = zero;
            else
               if (tick)
                  n_state = one;
						
         one:
         begin
			
            db = 1'b1;
            if(~SW)
               n_state = wait0_1;
					
         end
			
         wait0_1:
         begin
			
            db = 1'b1;
            if(SW)
            n_state = one;
         else
            if(tick)
               n_state = wait0_2;
					
         end
			
			wait0_2:
         begin
			
            db = 1'b1;
            if(SW)
               n_state = one;
            else
               if(tick)
                  n_state = wait0_3;
						
         end
			
         wait0_3:
         begin
			
            db = 1'b1;
            if(SW)
               n_state = one;
            else
               if(tick)
                  n_state = zero;
						
         end
			
         default : n_state = zero;
			
      endcase
		
   end
	
endmodule
