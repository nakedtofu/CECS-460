`timescale 1ns / 1ps
//****************************************************************// 
//  File name: <top_level.v>                                      // 
//                                                                // 
//  Created by Naoaki Takatsu on 10/2/2018.                       // 
//  Copyright © 2018  Naoaki Takatsu. All rights reserved.        // 
//                                                                // 
//                                                                // 
//  In submitting this file for class work at CSULB               // 
//  I am confirming that this is my work and the work             // 
//  of no one else. In submitting this code I acknowledge that    // 
//  plagiarism in student project work is subject to dismissal.   //  
//  from the class                                                // 
//****************************************************************//

module top_level(clk, resetmeta, Eight, Pen, OHEL, baud_in, LED, tx);
	 
	 input  clk, resetmeta, Eight, Pen, OHEL;
	 input  [3:0] baud_in;
	 output tx;
	 output reg [15:0] LED;
	 
	 reg interrupt, load;
	 reg [15:0] data_16bit;

	 wire   reset, tick, p_o, ped, interrupt_ack, write_strobe;
	 wire   [15:0] out_port, port_id;
	 
	 
	 AISO aiso(.clk(clk), .resetmeta(resetmeta), .resetout(reset));

    pulse_maker PED(clk, reset, p_o, ped);
	 
	 tramelblaze_top tb_top(
	    .CLK(clk), .RESET(reset), .IN_PORT( 16'b0 ), 
	    .INTERRUPT(interrupt), .OUT_PORT(out_port), 
		 .PORT_ID(port_id), .READ_STROBE(),
	    .WRITE_STROBE(write_strobe), 
		 .INTERRUPT_ACK(interrupt_ack)
	 );
	 
	 TX_Engine tx_engine( .clk(clk), .reset(reset), .port_id(port_id), .write_strobe(write_strobe), .baud_in(baud_in),
                         .out_port(out_port[7:0]), .Eight(Eight), .Pen(Pen), .OHEL(OHEL), .tx_rdy(p_o), .tx(tx) );
	
	//RS flop
	always @ (posedge clk, posedge reset)
	begin
	
	   if (reset)
		   interrupt <= 1'b0;
		else if(ped)
		   interrupt <= 1'b1;
		else if(interrupt_ack)
		   interrupt <= 1'b0;
		else
		   interrupt <= interrupt;
	
	end
	
	//comparator
	always @ (*)
	begin
	
	   if( (port_id == 16'h0000) & write_strobe )
	      load <= 1'b1;
		else
		   load <= 1'b0;
		
	end
		
	//16 bit loadable register
	always @ (posedge clk, posedge reset)
	begin
	
	   if (reset)
		   data_16bit <= 1'b0;
		else if(load)
		   data_16bit <= out_port;
		else
		   data_16bit <= data_16bit;
	
	end
	
	//Walking LED
	always @ (*)
	begin
	
	   if( (port_id == 16'h0006) & write_strobe )
	      LED <= out_port;
		else
		   LED <= LED;
		
	end

endmodule
