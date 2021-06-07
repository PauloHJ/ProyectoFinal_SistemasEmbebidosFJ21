`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:11 06/06/2021 
// Design Name: 
// Module Name:    MuxDecryptor 
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
module MuxDecryptor(
   input MixRy,
    input ShiftRy,
    input SubRy,
    input AddRy,
    output reg Ry,
    input [127:0] MixText,
    input [127:0] ShiftText,
    input [127:0] SubText,
    input [127:0] AddText,
    output reg [127:0] Text
    );
	 
	 wire [3:0] signals;
	 assign signals = {MixRy,ShiftRy, SubRy, AddRy};
	 
	 always @(*)
	 begin
		case (signals)
			4'b0000 : Ry = 0;
			4'b0001 : begin Ry = 1; Text = AddText; end
			4'b0010 : begin Ry = 1; Text = SubText; end
			4'b0100 : begin Ry = 1; Text = ShiftText; end
			4'b1000 : begin Ry = 1; Text = MixRy; end
			default : Ry = 0;
		endcase
	 end
	 
	 
	 


endmodule
