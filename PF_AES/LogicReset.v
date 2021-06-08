`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:59:19 06/07/2021 
// Design Name: 
// Module Name:    LogicReset 
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
module LogicReset (Rst, ReadyKey, RstKey) ;
  input      Rst;
  input      ReadyKey;
  output     RstKey;


	// EASE/HDL end ////////////////////////////////////////////////////////////////
	assign RstKey = (~ReadyKey)|Rst;


endmodule // LogicReset

