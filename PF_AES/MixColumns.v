`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:22:24 06/06/2021 
// Design Name: 
// Module Name:    MixColumns 
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
module MixColumns(
    input Rst,
    input Clk,
    input En_MXC,
    output reg Ry_MXC,
    input [127:0] In_MXC,
    output reg [127:0] Out_MXC
    );

	//Constant matrix for M2 and M3 for more info:
	//M2 Multiplication
	function [7:0] m2; // binary multiplication with 2
	input [7:0] x;
		begin
			m2={x[6:0],1'b0} ^ (8'h1b & {8{x[7]}}); 
			// 1bit left shift then conditional check if 1st bit is 1 then add 00011011 with shifted number
		end
	endfunction
	// M3 Multiplication
	function [7:0] m3;
		input [7:0] x;
			begin
				m3= m2(x)^x; // mul with 2 and then add it with itself
			end
	endfunction
	
	//Function for 32 bit
	//Convert 32 bits to 4 groups of 8 bits
	function [31:0] mixcolumn32;
		input [31:0] c;
			reg [7:0] a0,a1,a2,a3;  // 8bit 
			reg [7:0] ma0,ma1,ma2,ma3;
				begin
					a0=c[31:24];
					a1=c[23:16];
					a2=c[15:8];
					a3=c[7:0];
					
					ma0 = m2(a0) ^ m3(a1) ^ a2    ^ a3;
					ma1 = a0     ^ m2(a1) ^ m3(a2)^ a3;
					ma2 = a0     ^ a1     ^ m2(a2)^ m3(a3);
					ma3 = m3(a0) ^ a1     ^ a2    ^ m2(a3);
					
					mixcolumn32 = {ma0,ma1,ma2,ma3};
				end 
	endfunction
	
	//Mix Column Function 
	//Convert the 128 bits into 4 groups of 32 bits 
	 function [127 : 0] mixcolumns;
	 input [127 : 0] data;
    reg [31 : 0] w0, w1, w2, w3;
    reg [31 : 0] ws0, ws1, ws2, ws3;
	 reg [31 : 0] row0, row1, row2, row3;
    begin
      w0 = {data[127:120],data[95:88],data[63:56],data[31:24]};
      w1 = {data[119:112],data[87:80],data[55:48],data[23:16]};
      w2 = {data[111:104],data[79:72],data[47:40],data[15:8]};
      w3 = {data[103:96],data[71:64],data[39:32],data[7:0]};

      ws0 = mixcolumn32(w0);
      ws1 = mixcolumn32(w1);
      ws2 = mixcolumn32(w2);
      ws3 = mixcolumn32(w3);
		//Columns convert to rows
		row0 = {ws0[31:24],ws1[31:24],ws2[31:24],ws3[31:24]};
		row1 = {ws0[23:16],ws1[23:16],ws2[23:16],ws3[23:16]};
		row2 = {ws0[15:8],ws1[15:8],ws2[15:8],ws3[15:8]};
		row3 = {ws0[7:0],ws1[7:0],ws2[7:0],ws3[7:0]};
      mixcolumns = {row0, row1, row2, row3};
    end
  endfunction // mixcolumns
  
  
	//Mix Column Process for Clk signal
	always@(posedge Clk) 
	begin //1 
		if (Rst)
		begin //0
			//Initialize to initial values
			Out_MXC = 128'd0;	
			Ry_MXC = 0;
		end //0
		else 
			if (En_MXC) // If the previos process finish
			begin // 0
				//Process
				Out_MXC = mixcolumns(In_MXC);
				Ry_MXC = 1; 

			end //0
			//Send signal so following process can continue
	end //1
	
endmodule
