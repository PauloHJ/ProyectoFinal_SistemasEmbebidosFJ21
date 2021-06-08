`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:50:33 06/05/2021 
// Design Name: 
// Module Name:    AES_Decryptor 
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
module AES_Decryptor(
    input Clk,
    input Rst,
    input En,
    input [127:0] Key,
    input [127:0] CT,
    output [3:0] SelKey,
    output Ry,
    output [127:0] PT
    );
	 
	 //	Embedded Signals
	 wire [127:0] Text;
	 wire [127:0] ModifiedText;
	 
	 // AddRoundKey
	 wire AddRy;
	 wire AddEn;
	 wire [127:0] CurrentKey;
	 wire [127:0] AddText;
	 // InvSubBytes
	 wire SubEn;
	 wire SubRy;
	 wire [127:0] SubText;
	 
	 // InvShiftRows
	 wire ShiftEn;
	 wire ShiftRy;
	 wire [127:0] ShiftText;
	 
	 // InvMixCols
	 wire MixEn;
	 wire MixRy;
	 wire [127:0] MixText;
	 
	 StateMachineDecryptor C01
	 (
		.Rst(Rst),
		.Clk(Clk),
		.En(En),
		.CT(CT),
		.SelKey(SelKey),
		.Ry(Ry),
		.PT(PT),
		.AddEn(AddEn),
		.SubEn(SubEn),
		.ShiftEn(ShiftEn),
		.MixEn(MixEn),
		.AddRy(AddRy),
		.SubRy(SubRy),
		.ShiftRy(ShiftRy),
		.MixRy(MixRy),
		.Text(Text),
		.MixText(MixText),
		.ShiftText(ShiftText),
		.SubText(SubText),
		.AddText(AddText)
		//.ModifiedText(ModifiedText)
	 );
	 
	 
	 AddRoundKeyDecryptor C02
	 (
		.En(AddEn),
		.Clk(Clk),
		.Key(Key),
		.Ry(AddRy),
		.Text(Text),
		.ModifiedText(AddText)
	 );
	 
	 InvSubBytes C03
	 (
		.En(SubEn),
		.Ry(SubRy),
		.CT(Text),
		.CT_2(SubText)
	 );
	 
	 InvShiftRows C04
	 (
		.ClkEn(ShiftEn),
		.Ry(ShiftRy),
		.data(Text),
		.dataOut(ShiftText)
	 );
	 
	 InvMixColumns C05
	 (
		.Mix_En(MixEn),
		.Clk(Clk),
		.Text(Text),
		.Modified_Text(MixText),
		.Mix_Ry(MixRy)
	 );

endmodule
