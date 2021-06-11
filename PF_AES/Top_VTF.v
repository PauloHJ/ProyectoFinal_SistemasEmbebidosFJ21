`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:22:59 06/10/2021
// Design Name:   Top
// Module Name:   L:/Escuela/Profesional/Semestre 10/PF_AES/Top_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Top_VTF;

	// Inputs
	reg Clk;
	reg Rst;
	reg Rx;

	// Outputs
	wire Tx;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.Clk(Clk), 
		.Rst(Rst), 
		.Rx(Rx), 
		.Tx(Tx)
	);

	 always
    begin
      #10 Clk = ~Clk; #10 Clk = ~Clk;
    end

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 0;
		Rx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Rst = 1;
		#30
		Rst = 0;

	
	end
      
endmodule

