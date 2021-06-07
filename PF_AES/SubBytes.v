`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:21:10 06/06/2021 
// Design Name: 
// Module Name:    SubBytes 
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
module SubBytes(
    input 		Rst,
    input 		Clk,
    input 		En_SBT,
    output reg Ry_SBT,
    input 		[127:0] In_SBT,
    output reg	[127:0] Out_SBT
    );

	reg [127:0]Out_temp;
	reg [7:0]  sbox [size-1:0];

	// Constants
	parameter size = 256;
	integer i;

  	initial begin 
		$readmemh("sbox.mem", sbox); 	
		Out_temp = 0;
		Ry_SBT = 0;		
	end		
	
	
	// Output Result
  always @(posedge Clk or posedge Rst)
  begin
    if (Rst)
		begin
			Out_temp = 0;
			Ry_SBT = 0;
		end
    else
		if (En_SBT)
		begin			
			for (i = 0; i<16; i=i+1)
			begin
				Out_temp[127-(8*i)-:8]= sbox[In_SBT[127-(8*i)-:8]];
			end	
			Out_SBT = Out_temp;
			Ry_SBT = 1;
		end
		else
		begin
			Ry_SBT = 0;
		end
  end

endmodule