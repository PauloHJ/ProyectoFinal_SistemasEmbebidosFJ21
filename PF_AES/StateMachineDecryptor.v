`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:04 06/05/2021 
// Design Name: 
// Module Name:    StateMachineDecryptor 
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
module StateMachineDecryptor(
    input Rst,
    input Clk,
    input En,
    input [127:0] CT,
    output reg [3:0] SelKey,
    output reg Ry,
    output reg [127:0] PT,
    output reg AddEn,
    output reg SubEn,
    output reg ShiftEn,
    output reg MixEn,
    input AddRy,
    input SubRy,
    input ShiftRy,
    input MixRy,
    output reg [127:0] Text,
    input [127:0] MixText,
    input [127:0] ShiftText,
    input [127:0] SubText,
    input [127:0] AddText
    );


	 localparam
		AddRoundKey     = 3'b000,
		InvSubBytes     = 3'b001,
		InvShiftRows    = 3'b010,
		InvMixColumns   = 3'b011,
		FinishState     = 3'b100,
		HoldState       = 3'b111;

	 //	Embedded signals
	 reg [3:0] Round;
	 reg [2:0] pres_state;


	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			Round=10;
			pres_state = HoldState;
			Ry=0;
			PT = CT;
			Text = CT;
			SelKey = 10;
		end
		else if(En)
		begin			
			case (pres_state)
				InvShiftRows : begin
					if (ShiftRy) begin
						PT = ShiftText;
						Text = ShiftText;
						pres_state = InvSubBytes;
					end
				end
				InvSubBytes : begin
					if (SubRy) begin
						PT = SubText;
						Text = SubText;
						pres_state = AddRoundKey;
					end
				end
				AddRoundKey : begin 
					if (AddRy)
					begin
						PT = AddText;
						Text = AddText;
						
						if(Round == 10)
						begin
							Round = Round - 1;
							pres_state = InvShiftRows;
						end
						else if(Round > 0)
						begin
							pres_state = InvMixColumns;
						end
						else
						begin
							pres_state = FinishState;
						end
					end
				end
				InvMixColumns : begin
					if(MixRy)
					begin
						PT = MixText;
						Text = MixText;
						Round = Round - 4'b0001;
						pres_state = InvShiftRows;
					end
				end
				FinishState: begin
					Ry=1;
				end
				HoldState: begin
					pres_state = AddRoundKey; 
				end
				default: pres_state = AddRoundKey; 
			endcase

			SelKey = Round;
		end
	 end

	 always @(pres_state)// Turn on/off modules
	 begin
		case (pres_state)
			FinishState     :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=0; end
			HoldState       :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=0; end
			AddRoundKey     :   begin AddEn = 1; SubEn = 0; ShiftEn = 0; MixEn=0; end
			InvSubBytes     :   begin AddEn = 0; SubEn = 1; ShiftEn = 0; MixEn=0; end
			InvShiftRows    :   begin AddEn = 0; SubEn = 0; ShiftEn = 1; MixEn=0; end
			InvMixColumns   :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=1; end
			default         :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=0; end
		endcase
	 end
	 
endmodule
