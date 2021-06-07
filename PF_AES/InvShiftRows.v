`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:55:43 06/05/2021 
// Design Name: 
// Module Name:    InvShiftRows 
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
module InvShiftRows(
	input ClkEn,
	input  [127:0] data,
	output reg [127:0] dataOut,
	output reg		Ry
);

	reg [31 : 0] w0, w1, w2, w3;
   reg [31 : 0] ws0, ws1, ws2, ws3;
	
	always @(*) 
	begin
		if(ClkEn) 
		begin
			w0  = data[127 : 096];
			w1  = data[095 : 064];
			w2  = data[063 : 032];
			w3  = data[031 : 000];
	
		// Commented lines are taking bytes by matrix columns
		// Uncommented are taken as rows
		
			//ws0 = {w0[31 : 24], w3[23 : 16], w2[15 : 08], w1[07 : 00]};
			ws0 = w0;
			//ws1 = {w1[31 : 24], w0[23 : 16], w3[15 : 08], w2[07 : 00]};
		   ws1 = {w1[07 : 00], w1[31 : 08]};
			//ws2 = {w2[31 : 24], w1[23 : 16], w0[15 : 08], w3[07 : 00]};
	      ws2 = {w2[15 : 00], w2[31 : 16]};
			//ws3 = {w3[31 : 24], w2[23 : 16], w1[15 : 08], w0[07 : 00]};
			ws3 = {w3[23 : 00], w3[31 : 24]};
			Ry=1;
		end
		else
			Ry=0;
	end
	
	always @(*)
	begin
		if (Ry)
		begin
			dataOut = {ws0, ws1, ws2, ws3};
		end
	end
	
endmodule
