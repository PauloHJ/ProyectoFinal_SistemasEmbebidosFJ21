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
    input ModuleRy,
    output reg [127:0] Text,
    input [127:0] ModifiedText
    );
	 
	 
	 localparam
		AddRoundKey = 2'b00,
		InvSubBytes = 2'b01,
		InvShiftRows = 2'b10,
		InvMixColumns = 2'b11;
	 
	 //	Embedded signals
	 reg [3:0] Round;
	 reg [1:0] pres_state;
	 reg [1:0] next_state;
	 reg done;
	 
	 
	 initial
	 begin
		done=0;
		Round=0;
		pres_state = AddRoundKey;
		Text = CT;
		Ry=0;
	 end
	 
	 
	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			pres_state = AddRoundKey;
			Text = CT;
			//Round = 0;
			//done = 0;
		end
		else if (En)
		begin
			pres_state = next_state;
			SelKey = Round;
			Text = ModifiedText;
		end
	end
	
	
	
	 always @(ModuleRy or pres_state or Round)
	 begin
		if(ModuleRy)
		begin
			if (Round < 10)
			begin
				if (pres_state ==AddRoundKey)
				begin
					Round=Round+1;
				end
				case (pres_state)
					AddRoundKey : next_state = InvSubBytes;
					InvSubBytes : next_state = InvShiftRows;
					InvShiftRows : next_state = InvMixColumns;
					InvMixColumns : next_state = AddRoundKey;			
				endcase 
			end
			else
			begin
				case (pres_state)
					InvSubBytes : next_state = InvShiftRows;
					InvShiftRows : next_state = AddRoundKey;
					AddRoundKey : done = 1;
					default : done = 0;
				endcase
			end
		end
	 end
	 
	 always @(pres_state)// Turn on/off modules
	 begin
		case (pres_state)
			AddRoundKey :   begin AddEn = 1; SubEn = 0; ShiftEn = 0; MixEn=0; end
			InvSubBytes :   begin AddEn = 0; SubEn = 1; ShiftEn = 0; MixEn=0; end
			InvShiftRows :  begin AddEn = 0; SubEn = 0; ShiftEn = 1; MixEn=0; end
			InvMixColumns : begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=1; end
		endcase
	 end
	 
	 always @(posedge Clk)
	 begin
		if (done)
		begin
			PT=ModifiedText;
			Ry=1;
		end
	 end
	 


endmodule
