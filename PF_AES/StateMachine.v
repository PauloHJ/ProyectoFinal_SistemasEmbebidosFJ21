`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:45 06/04/2021 
// Design Name: 
// Module Name:    StateMachine 
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
module StateMachine(
    input Rst,
    input Clk,
    input En,
    input [127:0] PT,
    output reg [127:0] CT,
    output reg En_ARK,
    output reg En_SBT,
    output reg En_SHR,
    output reg En_MXC,
    output reg Rst_ARK,
    output reg Rst_SBT,
    output reg Rst_SHR,
    output reg Rst_MXC,
    input Ry_ARK,
    input Ry_SBT,
    input Ry_SHR,
    input Ry_MXC,
    output reg [127:0]  Text,
    input [127:0] Text_ARK,
    input [127:0] Text_SBT,
    input [127:0] Text_SHR,
    input [127:0] Text_MXC,
    output reg [3:0]    KeySel,
    output reg          Ry
    );

    localparam
        Begin     		= 3'b000,
        AddRoundKey     = 3'b001,
        SubBytes  		= 3'b010,
        ShiftRows 		= 3'b011,
        MixCols	 		= 3'b100,
        End				= 4'b101;	// localparam ends here


   reg  [3:0] Round;
	reg  [2:0] pres_state;


	// Finite State Machine Section (State Diagram)
	always @(negedge Clk)
	begin
       if(Rst)
       begin
            Round       = 0;
			KeySel      = 0;
            pres_state  = Begin;
            Ry          = 0;
            Text        = PT;
			CT          = PT;
		end
		else if(En)
		begin
            case(pres_state)
					Begin: begin
                    Rst_ARK = 1;
                    pres_state = AddRoundKey;
                end
                AddRoundKey : begin
                    if  (Ry_ARK) begin
                        Text = Text_ARK;
                        CT = Text_ARK;

                        if(Round < 10) begin
                            Rst_SBT = 1;
                            Round = Round + 4'b0001;
									 pres_state = SubBytes;
                        end
                        else begin
                            pres_state = End;
                        end
                    end
                    else begin
                        Rst_ARK = 0;
                    end
                end
                SubBytes 	: 	begin
                    if  (Ry_SBT) begin
                        Rst_SHR = 1;
                        Text = Text_SBT;
								CT = Text_SBT;
								pres_state = ShiftRows;
                    end
                    else begin
                        Rst_SBT = 0;
                    end
                end
                ShiftRows 	:  begin
                    if  (Ry_SHR) begin
                        Text = Text_SHR;
								CT = Text_SHR;
                        if(Round == 10) begin
                            Rst_ARK = 1;
                            pres_state = AddRoundKey;
                        end
                        else begin
                            Rst_MXC = 1;
                            pres_state = MixCols;
                        end
                    end
                    else begin
                        Rst_SHR = 0;
                    end
                end
                MixCols 		: 	begin
                    if  (Ry_MXC) begin
                        Text = Text_MXC;
								CT = Text_MXC;
                        Rst_ARK = 1;
                        pres_state = AddRoundKey;
                    end
                    else begin
                        Rst_MXC = 0;
                    end
                end
                End 		:  begin
                    Ry = 1;
                end
                default: begin
                    Rst_ARK = 1;
                    pres_state = AddRoundKey;
                end
            endcase
				
				KeySel      = Round;
        end
    end


    always @(pres_state)
    begin
        case (pres_state)
            Begin 			: begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 0; end
            AddRoundKey 	: begin En_ARK = 1; En_SBT = 0; En_SHR = 0;	En_MXC = 0;	end
            SubBytes  	   : begin En_ARK = 0; En_SBT = 1; En_SHR = 0;	En_MXC = 0;	end
            ShiftRows  	   : begin En_ARK = 0; En_SBT = 0; En_SHR = 1;	En_MXC = 0; end
            MixCols  		: begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 1; end
            End 			   : begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 0; end
				default        : begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 0; end
        endcase
    end

endmodule 