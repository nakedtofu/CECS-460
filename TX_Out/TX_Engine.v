`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:20 10/29/2018 
// Design Name: 
// Module Name:    TX_Engine 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TX_Engine( clk, reset, port_id, write_strobe, baud_in,
                  out_port, Eight, Pen, OHEL, tx_rdy, tx );

input        clk, reset, write_strobe, Eight, Pen, OHEL;
input  [3:0] baud_in;
input [7:0] out_port;
input [15:0] port_id;

output reg tx_rdy;
output     tx;

wire BTU, DONE, LOAD;
wire [1:0] sd_out;
wire [18:0] baud_out;

reg DOIT, LOADD1;
reg [7:0] LDATA;

Baud_Decode baud_decode ( .Baud(baud_in), .Baud_Out(baud_out) );
Bit_Time_Counter btc ( .clk(clk), .reset(reset), .DOIT(DOIT), .BAUD(baud_out), .BTU(BTU) );
Bit_Counter bc ( .clk(clk), .reset(reset), .BTU(BTU), .DOIT(DOIT), .DONE(DONE) );
SD_Decode sd_decode ( .Eight(Eight), .PEN(Pen), .OHEL(OHEL), .Din(LDATA), .Decode_Out(sd_out) );
shift_register shift_reg ( .clk(clk), .reset(reset), .Load(LOADD1), .SH(BTU), .SDI(1'b1), .Data( {2'b10, LDATA[6:0], sd_out} ), .SDO(tx));

//LOAD AND GATE
assign LOAD = ( (port_id == 0) && (write_strobe) ) ? 1'b1:1'b0;

//tx_rdy RS flop
always @ (posedge clk, posedge reset)
begin

	if (reset)
		tx_rdy <= 1'b1;
	else if(LOAD)
		tx_rdy <= 1'b0;
	else if(DONE)
		tx_rdy <= 1'b1;
	else
		tx_rdy <= tx_rdy;

end

//DOIT RS flop
always @ (posedge clk, posedge reset)
begin

	if (reset)
		DOIT <= 1'b0;
	else if(DONE)
		DOIT <= 1'b0;
	else if(LOADD1)
		DOIT <= 1'b1;
	else
		DOIT <= DOIT;

end

//LDATA loadable reg
always @ (posedge clk, posedge reset)
begin

	if (reset)
		LDATA <= 8'b0;
	else if(LOAD)
		LDATA <= out_port[7:0];
	else
		LDATA <= LDATA;

end

//reg
always @ (posedge clk, posedge reset)
begin

	if (reset)
		LOADD1 <= 1'b0;
	else
		LOADD1 <= LOAD;

end

endmodule
