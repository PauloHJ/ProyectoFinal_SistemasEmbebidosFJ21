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
    output reg Ry,
    input [127:0] Key,
    output reg [3:0] SelKey,
    output reg [127:0] CT
    );

	wire Rst_ARK_SM;	wire Rst_SBT_SM;	wire Rst_SHR_SM;	wire Rst_MXC_SM;	
	wire Rst_ARK_Md;	wire Rst_SBT_Md;	wire Rst_SHR_Md;	wire Rst_MXC_Md;	
	assign Rst_ARK_Md = Rst_ARK_SM | Rst;
	assign Rst_SBT_Md = Rst_SBT_SM | Rst;
	assign Rst_SHR_Md = Rst_SHR_SM | Rst;
	assign Rst_MXC_Md = Rst_MXC_SM | Rst;
	wire En_ARK_SM;	wire En_SBT_SM;	wire En_SHR_SM;	wire En_MXC_SM;	
	wire Ry_ARK_SM;	wire Ry_SBT_SM;	wire Ry_SHR_SM;	wire Ry_MXC_SM;
	wire [127:0]Tx_SM;
	//
	wire [127:0]Out_ARK_M;	wire [127:0]Out_SBT_M;	wire [127:0]Out_SHR_M;	wire [127:0]Out_MXC_M;		
	wire [3:0]msg_sel_SM;	wire [127:0]msg_in_SM;
	wire CT_aux; wire SelKey_aux; wire Ry_aux;
	

	AddRoundKey    U1 (.Rst(Rst_ARK_Md),.Clk(Clk),.En_ARK(En_ARK_SM), .Ry_ARK(Ry_ARK_SM), .In_ARK(Tx_SM), .Out_ARK(Out_ARK_M), .Key_ARK(Key));
	SubBytes			U2 (.Rst(Rst_SBT_Md),.Clk(Clk),.En_SBT(En_SBT_SM), .Ry_SBT(Ry_SBT_SM), .In_SBT(Tx_SM), .Out_SBT(Out_SBT_M));
	ShiftRows		U3 (.Rst(Rst_SHR_Md),.Clk(Clk),.En_SHR(En_SHR_SM), .Ry_SHR(Ry_SHR_SM), .In_SHR(Tx_SM), .Out_SHR(Out_SHR_M));
	MixColumns		U4 (.Rst(Rst_MXC_Md),.Clk(Clk),.En_MXC(En_MXC_SM), .Ry_MXC(Ry_MXC_SM), .In_MXC(Tx_SM), .Out_MXC(Out_MXC_M));	
	
	Mux				U5 (.Rst(Rst),.Clk(Clk),.ARK_res(Out_ARK_M),.SBT_res(Out_SBT_M),.SHR_res(Out_SHR_M),.MXC_res(Out_MXC_M),.res_sel(msg_sel_SM),.res(msg_in_SM));
	
	StateMachine   U6 (.Rst(Rst),.Clk(Clk),.En(En),.PT(PT),.CT(CT_aux),.En_ARK(En_ARK_SM),.Rst_ARK(Rst_ARK_SM),.Ry_ARK(Ry_ARK_SM),.Tx_out(Tx_SM),
																						.En_SBT(En_SBT_SM),.Rst_SBT(Rst_SBT_SM),.Ry_SBT(Ry_SBT_SM),
																						.En_SHR(En_SHR_SM),.Rst_SHR(Rst_SHR_SM),.Ry_SHR(Ry_SHR_SM),
																						.En_MXC(En_MXC_SM),.Rst_MXC(Rst_MXC_SM),.Ry_MXC(Ry_MXC_SM),
																						.KeySel(SelKey_aux),.msg_sel(msg_sel_SM),.msg_in(msg_in_SM),.Ry(Ry_aux));

	always@(*)
	begin
		if(Rst)
			begin
				SelKey = SelKey_aux;
				CT = CT_aux;
				Ry <= Ry_aux;
			end
	end
	
endmodule
