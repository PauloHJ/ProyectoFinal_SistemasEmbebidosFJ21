`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:21:48 06/06/2021 
// Design Name: 
// Module Name:    ShiftRows 
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
module ShiftRows(

    input Rst,
    input Clk,
    input En_SHR,
    output reg Ry_SHR,
    input [127:0] In_SHR,
    output reg [127:0] Out_SHR
    );
	 //Registers declaration
	 reg [31:0] row1;
	 reg [31:0] row2;
	 reg [31:0] row3;
	 reg [31:0] row4;
	 
	 //Signal that indicates if the 
	 //program has finished shifting

	 always @(posedge Clk)
	 begin
		if (Rst)
			begin
				//Reset values
				row1=0;
				row2=0;
				row3=0;
				row4=0;
				Ry_SHR=0;
			end
		else if (En_SHR)
			begin
				//Row 1 is not shifted
				row1 = In_SHR [127:96];
				//Row 2 is shifted 1 position to the left
				row2 = {In_SHR [87:80],In_SHR [79:72],In_SHR [71:64],In_SHR [95:88]};
				//Row 3 is shifted 2 position to the left
				row3 = {In_SHR [47:40],In_SHR [39:32],In_SHR [63:56],In_SHR [55:48]};
				//Row 4 is shifted 3 position to the left
				row4 = {In_SHR [7:0],In_SHR [31:24],In_SHR [23:16],In_SHR [15:8]};
				//Send finish signal
				Out_SHR  	= {row1,row2,row3,row4};
				Ry_SHR=1;
			end
		else
			begin
				//Reset finish signal
				Ry_SHR=0;
			end
	 end

endmodule
