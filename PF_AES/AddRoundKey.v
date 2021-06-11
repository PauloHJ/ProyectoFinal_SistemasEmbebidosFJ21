`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:20:25 06/06/2021 
// Design Name: 
// Module Name:    AddRoundKey 
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
module AddRoundKey(
    input 		Rst,
    input 		Clk,
    input 		En_ARK,
    output reg Ry_ARK,
    input 		[127:0] In_ARK,
    output reg	[127:0] Out_ARK,
    input 		[127:0] Key_ARK
    );
	 
	 integer i;
	 always @ (posedge Clk)
	 begin
		if (Rst)
			begin
				Ry_ARK = 0;
				Out_ARK = 0;
			end
		else
			if (En_ARK)
			begin
				for (i = 0; i < 128; i = i + 1) begin
					Out_ARK [i] = In_ARK [i] ^ Key_ARK [i];
				end
				Ry_ARK = 1;
			end
			else
				Ry_ARK = 0;
	 end

endmodule
