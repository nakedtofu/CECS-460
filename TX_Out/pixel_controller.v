`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <pixel_controller.v>                               // 
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

module pixel_controller(clk, tick, reset, present_out, present_state);

        input            clk, tick, reset;
        output reg [7:0] present_out;
        output reg [2:0] present_state;
        
        reg [2:0]  next_state;
        reg [7:0] next_out;
        
        always @ (posedge clk, posedge reset)
           if (reset)
              {present_state, present_out} <= {3'b000, 8'b11111111}; 
           else 
              {present_state, present_out} <= {next_state, next_out};
                
        always @ (*)
        begin
           next_out   = present_out;
	        next_state = present_state;

	        if (tick)
              case(present_state)
                 3'b000: {next_state, next_out} = {3'b001, 8'b11111101};
                 3'b001: {next_state, next_out} = {3'b010, 8'b11111011};
                 3'b010: {next_state, next_out} = {3'b011, 8'b11110111};
                 3'b011: {next_state, next_out} = {3'b100, 8'b11101111};
                 3'b100: {next_state, next_out} = {3'b101, 8'b11011111};
                 3'b101: {next_state, next_out} = {3'b110, 8'b10111111};
                 3'b110: {next_state, next_out} = {3'b111, 8'b01111111};
                 3'b111: {next_state, next_out} = {3'b000, 8'b11111110};
                 endcase
                
        end

endmodule
