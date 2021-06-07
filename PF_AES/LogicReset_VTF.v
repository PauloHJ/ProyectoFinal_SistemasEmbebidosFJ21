`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:20 06/07/2021
// Design Name:   LogicReset
// Module Name:   L:/Escuela/Profesional/Semestre 10/Sistemas Embebidos/PF_AES/LogicReset_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LogicReset
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LogicReset_VTF;

	// Inputs
	reg Rst;
	reg ReadyKey;

	// Outputs
	wire RstKey;

	// Instantiate the Unit Under Test (UUT)
	LogicReset uut (
		.Rst(Rst), 
		.ReadyKey(ReadyKey), 
		.RstKey(RstKey)
	);

	initial begin
		// Initialize Inputs
		Rst = 0;
		ReadyKey = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10;
		Rst = 1;
		ReadyKey = 1;
		#10;
		
		if (RstKey == 1'b1) 
			begin
			$display("***PASS: Reset when external reset***");
			end
		else 
			begin
			$display("***ERROR1: RstKey = %h and must be  1***", RstKey);
			end 

		#10;
		Rst = 0;
		ReadyKey = 1;
		#10;
		if (RstKey == 1'b0) 
			begin
			$display("***PASS: No reset is present***");
			end
		else 
			begin
			$display("***ERROR1: RstKey = %h and must be  0***", RstKey);
			end 

		
		#10;
		Rst = 0;
		ReadyKey = 0;
		#10;
		if (RstKey == 1'b1) 
			begin
			$display("***PASS: Ready key is not ready, so reset the scheduler***");
			end
		else 
			begin
			$display("***ERROR1: RstKey = %h and must be  1***", RstKey);
			end 
	end
      
endmodule

