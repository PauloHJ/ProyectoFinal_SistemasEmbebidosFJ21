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


	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			pres_state = AddRoundKey;
			SelKey = 10;
			Text = CT;
		end
		else if (En)
		begin
			pres_state = next_state;
			SelKey = Round;
			Text = ModifiedText;
		end
	end



	 always @(negedge Clk)
	 begin
		if (Rst)
		begin
			Round=10;
			next_state = AddRoundKey;
			PT=0;
			Ry=0;
		end
		else
		begin
			case (pres_state)
				InvShiftRows : begin
					if (ShiftRy) next_state = InvSubBytes;
				end
				InvSubBytes : begin
					if (SubRy) next_state = AddRoundKey;
				end
				AddRoundKey : begin 
					if (AddRy)
					begin
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
							PT=ModifiedText;
							Ry=1;
						end
					end
				end
				InvMixColumns : begin
					if(MixRy)
					begin
						Round = Round - 1;
						next_state = InvShiftRows;
					end
				end
			endcase
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