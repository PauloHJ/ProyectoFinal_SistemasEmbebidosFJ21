`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:04 06/05/2021 
// Design Name: 
// Module Name:    Key_Selector 
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
module Key_Selector(
    input [3:0] SelKeyEnc,
    input [3:0] SelKeyDec,
    input DecEn,
    input EncEn,
    output reg [3:0]  SelKey
    );
	 wire [1:0] Sel;
	 assign Sel = {EncEn,DecEn};
	 
	 always @( SelKeyEnc or SelKeyDec or Sel )
    begin
      case( Sel )
          0 : SelKey = SelKeyDec;
          1 : SelKey = SelKeyDec;
          2 : SelKey = SelKeyEnc;
          3 : SelKey = SelKeyEnc;
      endcase
    end  
	 
endmodule
