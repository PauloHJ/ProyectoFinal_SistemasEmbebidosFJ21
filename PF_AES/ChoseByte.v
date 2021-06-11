`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:19 06/06/2021 
// Design Name: 
// Module Name:    ChoseByte 
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
module ChoseByte(
    input Select,
    output [7:0] OutputByte,
    input [7:0] InputByte1,
    input [7:0] InputByte2,
    output OutputByteReady,
    input InputByteReady1,
    input InputByteReady2
    );

    assign OutputByteReady = Select == 1'b0 ? InputByteReady1 : InputByteReady2;
    assign OutputByte = Select == 1'b0 ? InputByte1 : InputByte2;


endmodule
