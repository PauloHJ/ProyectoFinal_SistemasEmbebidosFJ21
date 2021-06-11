`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:11 05/28/2021 
// Design Name: 
// Module Name:    Controller 
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
module Controller (SerialReadEn, EncEn, DecEn, KeyEn, SerialWriteRy, EncRy,
    KeyRy, DecRy, Clk, Rst, SerialWriteEn, OutEn, OutRy, SerialReadRy, ProgramSelector, ProgramRunning, RstEncryptor, SerialKeyRy, RstKey) ;
    output reg SerialReadEn;
    output reg EncEn;
    output reg DecEn;
    output reg KeyEn;
    input      SerialWriteRy;
    input      EncRy;
    input      KeyRy;
    input      DecRy;
    input      Clk;
    input      Rst;
    output reg RstKey;
    input      ProgramSelector;
    output reg SerialWriteEn;
    output reg OutEn;
    output reg ProgramRunning;
    output reg RstEncryptor;
    input      OutRy;
    input      SerialReadRy;
	 input      SerialKeyRy;
	
    // State name definitions
     localparam
        Reset       = 3'b000,
        ReadSerial  = 3'b001,
        KeyState      = 3'b010,
        EncState      = 3'b011,
        DecState      = 3'b100,
        OutState      = 3'b101,
        WriteState    = 3'b110;  // localparam ends here

     // Embedded signals
     reg  [2:0] pres_state;
     reg  [2:0] next_state;
     wire [6:0] Signal;

     // Concatenate input signal for easier handling
     // Finite State Machine Section (State Diagram)
     always @(posedge Clk)
     begin
		 if(Rst)
		 begin
			pres_state = Reset;
			ProgramRunning = 0;
			RstEncryptor = 0;
			RstKey = 0;
		 end
		 else
		 begin
			 case (pres_state)
				 Reset       : begin
				    RstEncryptor = 0;
				    pres_state = ReadSerial;
				    RstKey = 0;
				 end
				 ReadSerial  : begin
				    if      (SerialReadRy && SerialKeyRy) begin
                        ProgramRunning = 1;
                        RstKey = 1;
                        pres_state = KeyState;
				    end
				 end
				 KeyState      : begin
				    if      (KeyRy) begin
				        RstEncryptor = 1;
				        if (ProgramSelector) pres_state = EncState;
				        else pres_state = DecState;
				    end
				    else begin
				        RstKey = 0;
				    end
                 end
				 EncState      : begin
				    if      (EncRy)	  pres_state = OutState;
				    else RstEncryptor = 0;
				 end
				 DecState      : begin
				    if      (DecRy)	  pres_state = OutState;
				 end
				 OutState      : begin
				    if      (OutRy)	  begin
				        pres_state = WriteState;
				    end
				    else begin
				        pres_state = OutState;
				    end
				 end
				 WriteState    : begin
				    if      (SerialWriteRy)	begin
				      ProgramRunning = 0;
				      pres_state = Reset;
				    end
				 end
				 default     : begin
				    pres_state = Reset;
				 end
			  endcase
		  end
     end

     // Output Section
     // Since we have a Moore FSM, output depend
     // on the pres_state only
     always @(pres_state)
     begin
        case (pres_state)
          Reset       : begin 
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 0;
			 end
          ReadSerial  : begin 
				SerialReadEn  = 1;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 0;				
			 end
          KeyState      : begin 
				SerialReadEn  = 0;
				KeyEn   = 1;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 0;
			 end
          EncState      : begin 
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 1;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 0;
			 end
          DecState      : begin
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 1;
				OutEn   = 0;
				SerialWriteEn = 0;
			 end
          OutState      : begin
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 1;
				SerialWriteEn = 0;
			 end
          WriteState    : begin
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 1;
			 end
          default     : begin
				SerialReadEn  = 0;
				KeyEn   = 0;
				EncEn   = 0;
				DecEn   = 0;
				OutEn   = 0;
				SerialWriteEn = 0;
			 end
        endcase
     end

endmodule 