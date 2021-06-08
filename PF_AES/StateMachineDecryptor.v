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
		AddRoundKey = 3'b000,
		InvSubBytes = 3'b001,
		InvShiftRows = 3'b010,
		InvMixColumns = 3'b011,
		FinishState = 3'b100,
		HoldState = 3'b111;

	 //	Embedded signals
	 reg [3:0] Round;
	 reg [2:0] pres_state;
	 reg [2:0] next_state;


	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			pres_state = HoldState;
			SelKey = 10;
			PT = CT;
		end
		else if (En)
		begin
			pres_state = next_state;
			SelKey = Round;
			PT = Text;
		end
	end

	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			Round=10;
			next_state = AddRoundKey;
			Ry=0;
			Text = CT;
		end
		else if(En)
		begin
			case (pres_state)
				InvShiftRows : begin
					if (ShiftRy) begin
						next_state = InvSubBytes;
						Text = ShiftText;
					end
				end
				InvSubBytes : begin
					if (SubRy) begin
						next_state = AddRoundKey;
						Text = SubText;
					end
				end
				AddRoundKey : begin 
					if (AddRy)
					begin
						Text = AddText;
						
						if(Round == 10)
						begin
							next_state = InvShiftRows;
							Round = Round - 1;
						end
						else if(Round > 0)
						begin
							next_state = InvMixColumns;
						end
						else
						begin
							next_state = FinishState;
						end
					end
				end
				InvMixColumns : begin
					if(MixRy)
					begin
						Text = MixText;
						Round = Round - 1;
						next_state = InvShiftRows;
					end
				end
				FinishState: begin
					Text = AddText;
					Ry=1;
				end
				default: next_state = AddRoundKey; 
			endcase
		end
	 end

	 always @(pres_state)// Turn on/off modules
	 begin
		case (pres_state)
			FinishState :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=0; end
			HoldState :   begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=0; end
			AddRoundKey :   begin AddEn = 1; SubEn = 0; ShiftEn = 0; MixEn=0; end
			InvSubBytes :   begin AddEn = 0; SubEn = 1; ShiftEn = 0; MixEn=0; end
			InvShiftRows :  begin AddEn = 0; SubEn = 0; ShiftEn = 1; MixEn=0; end
			InvMixColumns : begin AddEn = 0; SubEn = 0; ShiftEn = 0; MixEn=1; end
		endcase
	 end
	 
endmodule


//	always
//	begin
//	  #10 Clk = ~Clk; #10 Clk = ~Clk;
//	end;
//
//	initial begin
//		// Initialize Inputs
//		Rst = 0;
//		Clk = 0;
//		En = 0;
//		CT = 0;
//		ModuleRy = 0;
//		ModifiedText = 0;
//
//		// Wait 100 ns for global reset to finish
//		#100;
//        
//		// Add stimulus here
//		Rst = 1; #20; Rst = 0; #20; 
//		En = 1;
//	
//		#200;
//		ModuleRy = 1;
//
//	end