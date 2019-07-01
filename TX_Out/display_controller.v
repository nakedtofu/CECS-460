`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <display_controller.v>                             // 
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

module display_controller(
	input            clk, // 100MHz clock
	input          reset, // reset
	input  [31:0]    din, // data input
	output  [7:0]  anode, // anode
	output  [6:0] cathode //cathode
   );

	wire           tick; // tick clock	
	wire  [2:0]  state; // state
	wire  [3:0] addr_out; // address out	
	 
	// pixel clock module
	ticker clk_ticker(
		.clk (clk), 
		.reset (reset),
		.tick (tick)
	);	
	
	// pixel controller module clk, tick, reset, present_out, present_state
	pixel_controller pix_con(
	   .clk(clk),
		.tick(tick),
		.reset(reset),
		.present_out(anode[7:0]),
		.present_state(state[2:0])
	);	

	// address mux module
	ad_mux addr_mux(
	   .sel(state[2:0]),
		.d7(din[31:28]),
		.d6(din[27:24]),
		.d5(din[23:20]),
		.d4(din[19:16]),
		.d3(din[15:12]),
		.d2(din[11:8]),
		.d1(din[7:4]),
		.d0(din[3:0]),
		.Y(addr_out[3:0])
	);
	
	// hex to 7 segment decoder module
	hex_to_7_segment_decoder h_to_7(
		.state(addr_out[3:0]),
		.display(cathode[6:0])
	);
	
endmodule
