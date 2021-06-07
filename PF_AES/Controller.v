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
module Controller(
	output     SerialReadEn,
	output     SerialWriteEn,
   output     EncEn,
   output     DecEn,
   output     KeyEn,
   input      SerialReadRy,
	input      SerialWriteRy,
   input      EncRy,
   input      KeyRy,
   input      DecRy,
   input      Clk,
   input      Rst,
   output     OutEn,
   input      OutRy
   );
	
	// State name definitions
	 localparam
		Reset       = 3'b000,
		ReadSerial  = 3'b001,
		KeyRdy      = 3'b010,
		EncRdy      = 3'b011,
		DecRdy      = 3'b100,
		OutRdy      = 3'b101,
		WriteRdy    = 3'b110;  // localparam ends here
		
	 // Embedded signals
	 reg  [2:0] pres_state;
	 reg  [2:0] next_state;
	 wire [6:0] Signal;
	 
	 // Output to the enable
	 reg  [5:0] outputs; // [5] ReadEn,[4] KeyEn, [3] EncEn, [2] DecEn, [1] OutEn, [0] WriteEn      
	 
	 // State Register section	
	 always @(posedge Clk)
	 begin
	   if (Rst)
		  pres_state = Reset;
		else
		  pres_state =  next_state;
	 end
	 
	 // Concatenate input signal for easier handling
	 assign Signal = {Rst,SerialReadRy,KeyRy,EncRy,DecRy,OutRy,SerialWriteRy};
	 // Finite State Machine Section (State Diagram)
	 always @(pres_state or Signal)
	 begin
	   case (pres_state)
		  Reset       : 							  next_state = ReadSerial;
		  ReadSerial  : if      (Signal[5])	  next_state = KeyRdy;
		  KeyRdy      : if      (Signal[4])	  next_state = EncRdy;
		  EncRdy      : if      (Signal[3])	  next_state = DecRdy;
		  DecRdy      : if      (Signal[2])	  next_state = OutRdy;
		  OutRdy      : if      (Signal[1])	  next_state = WriteRdy;
		  WriteRdy    : if      (Signal[0])	  next_state = Reset;
		  default     : 							  next_state = Reset;
		endcase
	 end
	 
	 // Output Section
	 // Since we have a Moore FSM, output depend
	 // on the pres_state only
	 always @(pres_state)
	 begin
	 	case (pres_state)
		  Reset       : begin outputs = 6'b000000; end
		  ReadSerial  : begin outputs = 6'b100000; end 
		  KeyRdy      : begin outputs = 6'b010000; end
		  EncRdy      : begin outputs = 6'b001000; end
		  DecRdy      : begin outputs = 6'b000100; end
		  OutRdy      : begin outputs = 6'b000010; end
		  WriteRdy    : begin outputs = 6'b000001; end
		  default     : begin outputs = 6'b000000; end
		endcase
	 end
	 
	 assign SerialReadEn  = outputs[5]; 
	 assign KeyEn   = outputs[4];
	 assign EncEn   = outputs[3];
	 assign DecEn   = outputs[2];
	 assign OutEn   = outputs[1];
	 assign SerialWriteEn = outputs[0];  

endmodule
