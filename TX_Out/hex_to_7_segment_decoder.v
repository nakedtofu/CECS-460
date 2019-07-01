`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <hex_to_7_segment_decoder.v>                       // 
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

module hex_to_7_segment_decoder(
    input      [3:0]  state, // 3 bit state_number
    output reg [6:0] display // 7 segment cathode display
    );

    always@(*)
	 begin
	 
		   case(state)
			
			    4'b0000: display <= {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_000, display 0
				 
				 4'b0001: display <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 // state = 0_001, display 1
				 
				 4'b0010: display <= {1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0}; 
				 // state = 0_010, display 2
				 
				 4'b0011: display <= {1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_011, display 3
				 
				 4'b0100: display <= {1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1}; 
				 // state = 0_100, display 4
				 
				 4'b0101: display <= {1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0}; 
				 // state = 0_101, display 5
				 
				 4'b0110: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; 
				 // state = 0_110, display 6
				 
				 4'b0111: display <= {1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 7
				 
				 4'b1000: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 8
				 
				 4'b1001: display <= {1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display 9
				 
				 4'b1010: display <= {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}; 
				 // state = 0_110, display A
				 
				 4'b1011: display <= {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}; 
				 // state = 0_110, display b
				 
				 4'b1100: display <= {1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display C
				 
				 4'b1101: display <= {1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1}; 
				 // state = 0_110, display d
				 
				 4'b1110: display <= {1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display E
				 
				 4'b1111: display <= {1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0}; 
				 // state = 0_110, display F
				 
				 default: display <= {1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}; 
				 // default, display nothing
				 
			endcase
			
	end // always
	
endmodule
