`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:47 05/28/2021 
// Design Name: 
// Module Name:    OutputSelector 
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
module OutputSelector(
	input       Sel,
	input       Rst,
   input       [127:0] PT,
   input       [127:0] CT,
   output reg  [127:0] Result,
   input       En,
	input       Clk,
   output reg  Ry
   );
	
	always @(posedge Clk)
	begin
	if(Rst) 
    begin
        Ry = 1'b0;
        Result = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00;
    end
	else if(En)
		begin
			if(Sel)
				Result = CT;
			else
				Result = PT;
			Ry = 1'b1;
		end
	end

endmodule
