`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:24:31 06/06/2021 
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
    output reg[127:0] CT,
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
    output reg [127:0] Tx_out,
	 /*
	 output [127:0] Tx_ARK,
    output [127:0] Tx_SBT,
    output [127:0] Tx_SHR,
    output [127:0] Tx_MXC,
	 */
    output reg [3:0] KeySel,
    output reg [3:0] msg_sel,
    input [127:0] msg_in,
    output reg  Ry
    );

	 localparam
		//Begin     		 = 4'b0000,
		AddRoundKey     = 4'b1000,
		SubBytes  		 = 4'b0100,
		ShiftRows 		 = 4'b0010,
		MixCols	 		 = 4'b0001,
		End				 = 4'b1111;	// localparam ends here

	//Concatenate input signal for easier handling
	wire [3:0] RySignal;
	assign RySignal = {Ry_ARK,Ry_SBT,Ry_SHR,Ry_MXC};
	
	
	reg  [3:0] pres_state;
	reg  [3:0] next_state;	
	integer count;
	integer operation;
	reg CT_aux;

	initial
		begin
			Ry = 0;
			count = 0;
			operation = 0;
			pres_state = AddRoundKey;
			CT_aux = 0;
			msg_sel = 4'b1000;
			KeySel = count;						
		end
		
	// State Register section
	always @(posedge Clk)
	begin
		if (Rst)
			begin
			//Se?ales que se van ir a 0			
				pres_state = AddRoundKey;				
				Tx_out = PT;
				msg_sel = 4'b1000;
			end
		else
			begin
				if(En)
					begin
								pres_state = next_state;
								case(pres_state)
									AddRoundKey : 	if  (RySignal[0]) 		msg_sel = 4'b1000;
									SubBytes 	:	if  (RySignal[1]) 		msg_sel = 4'b0100;
									ShiftRows 	:	if  (RySignal[2]) 		msg_sel = 4'b0010;
									MixCols 		:	if  (RySignal[3])	 		msg_sel = 4'b0001;
								endcase
								KeySel = count;						
								Tx_out = msg_in;									
					end
			end
	end 		

	// Finite State Machine Section (State Diagram)
	always @(pres_state or RySignal or count)
	begin 
		//if(RySignal)
			//begin
				if(count < 10)
					begin
						if(pres_state == AddRoundKey)
							begin
								count = count + 1;
							end
						case(pres_state)
							AddRoundKey :	if  (RySignal[0]) next_state = SubBytes;
							SubBytes 	: 	if  (RySignal[1])	next_state = ShiftRows;
							ShiftRows 	: 	if  (RySignal[2])	next_state = MixCols;
							MixCols 		: 	if  (RySignal[3])	next_state = AddRoundKey;
						endcase
					end
					else
						begin
							case(pres_state)
								AddRoundKey : if  (RySignal[0]) next_state = End;
								SubBytes 	: if  (RySignal[1]) next_state = ShiftRows;
								ShiftRows 	: if  (RySignal[2]) next_state = AddRoundKey;
							endcase						
						end
				//end
		end
		
		always@(pres_state)
			begin
			case (pres_state)
			  //Begin 			: begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 0;	Rst_ARK = 1; Rst_SBT = 1; Rst_SHR = 1;	Rst_MXC = 1; Ry = 0; end
			  AddRoundKey 	: begin En_ARK = 1; En_SBT = 0; En_SHR = 0;	En_MXC = 0;	Rst_ARK = 0; Rst_SBT = 1; Rst_SHR = 1;	Rst_MXC = 1; Ry = 0; end
			  SubBytes  	: begin En_ARK = 0; En_SBT = 1; En_SHR = 0;	En_MXC = 0;	Rst_ARK = 1; Rst_SBT = 0; Rst_SHR = 1;	Rst_MXC = 1; Ry = 0; end
			  ShiftRows  	: begin En_ARK = 0; En_SBT = 0; En_SHR = 1;	En_MXC = 0;	Rst_ARK = 1; Rst_SBT = 1; Rst_SHR = 0;	Rst_MXC = 1; Ry = 0; end
			  MixCols  		: begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 1;	Rst_ARK = 1; Rst_SBT = 1; Rst_SHR = 1;	Rst_MXC = 0; Ry = 0; end
			  End 			: begin En_ARK = 0; En_SBT = 0; En_SHR = 0;	En_MXC = 0;	Rst_ARK = 1; Rst_SBT = 1; Rst_SHR = 1;	Rst_MXC = 1; Ry = 1; end
			endcase
		end

	 always @(posedge Clk)
		 begin
			if(Ry)
				CT = CT_aux;
			else
				CT = 0;
		 end	 

endmodule
