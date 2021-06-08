`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:01 06/04/2021 
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
module AddRoundKeyDecryptor(
	input En,
	input Clk,
	input [127:0] Key,
	input [127:0] Text,
	output reg Ry,
//	input Rst,
	output reg [127:0] ModifiedText
    );

always @ (posedge Clk)
    begin
//       if (Rst) //En caso de necesitar Rst
//       begin
//	       ModifiedText = 0;
//	       Ry = 0; 
//	   end
//	   else
//	   begin 
	       if (En)
	       begin
	           ModifiedText = Text ^ Key;
	           Ry = 1; 
	       end
	       else
	           Ry= 0;
//	   end
    end
endmodule
