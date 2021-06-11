`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:01:53 06/05/2021 
// Design Name: 
// Module Name:    AES_Encryptor 
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
module AES_Encryptor(
    input [127:0] PT,
    input Clk,
    input Rst,
    input En,
    output Ry,
    input [127:0] Key,
    output [3:0] SelKey,
    output [127:0] CT
    );

    wire Rst_ARK_SM;	wire Rst_SBT_SM;	wire Rst_SHR_SM;	wire Rst_MXC_SM;
    wire Rst_ARK_Md;	wire Rst_SBT_Md;	wire Rst_SHR_Md;	wire Rst_MXC_Md;

    wire En_ARK_SM;	wire En_SBT_SM;	wire En_SHR_SM;	wire En_MXC_SM;
    wire Ry_ARK_SM;	wire Ry_SBT_SM;	wire Ry_SHR_SM;	wire Ry_MXC_SM;

    wire [127:0]Tx_SM;
    wire [127:0]Out_ARK_M;	wire [127:0]Out_SBT_M;	wire [127:0]Out_SHR_M;	wire [127:0]Out_MXC_M;

    StateMachine E01
    (
        .Rst(Rst),
        .Clk(Clk),
        .En(En),
        .PT(PT),
        .CT(CT),
        .En_ARK(En_ARK_SM),
        .En_SBT(En_SBT_SM),
        .En_SHR(En_SHR_SM),
        .En_MXC(En_MXC_SM),
        .Rst_ARK(Rst_ARK_SM),
        .Rst_SBT(Rst_SBT_SM),
        .Rst_SHR(Rst_SHR_SM),
        .Rst_MXC(Rst_MXC_SM),
        .Ry_ARK(Ry_ARK_SM),
        .Ry_SBT(Ry_SBT_SM),
        .Ry_SHR(Ry_SHR_SM),
        .Ry_MXC(Ry_MXC_SM),
        .Text(Tx_SM),
        .Text_ARK(Out_ARK_M),
        .Text_SBT(Out_SBT_M),
        .Text_SHR(Out_SHR_M),
        .Text_MXC(Out_MXC_M),
        .KeySel(SelKey),
        .Ry(Ry)
    );

	AddRoundKey     E02 (
	    .Rst(Rst_ARK_Md),
	    .Clk(Clk),
	    .En_ARK(En_ARK_SM),
	    .Ry_ARK(Ry_ARK_SM),
	    .In_ARK(Tx_SM),
	    .Out_ARK(Out_ARK_M),
	    .Key_ARK(Key)
    );
	SubBytes		E03 (
	    .Rst(Rst_SBT_Md),
	    .Clk(Clk),
	    .En_SBT(En_SBT_SM),
	    .Ry_SBT(Ry_SBT_SM),
	    .In_SBT(Tx_SM),
	    .Out_SBT(Out_SBT_M)
    );
	ShiftRows		E04 (
	    .Rst(Rst_SHR_Md),
	    .Clk(Clk),
	    .En_SHR(En_SHR_SM),
	    .Ry_SHR(Ry_SHR_SM),
	    .In_SHR(Tx_SM),
	    .Out_SHR(Out_SHR_M)
    );
	MixColumns		E05 (
	    .Rst(Rst_MXC_Md),
	    .Clk(Clk),
	    .En_MXC(En_MXC_SM),
	    .Ry_MXC(Ry_MXC_SM),
	    .In_MXC(Tx_SM),
	    .Out_MXC(Out_MXC_M)
    );

    assign Rst_ARK_Md = Rst_ARK_SM | Rst;
    assign Rst_SBT_Md = Rst_SBT_SM | Rst;
    assign Rst_SHR_Md = Rst_SHR_SM | Rst;
    assign Rst_MXC_Md = Rst_MXC_SM | Rst;

endmodule
