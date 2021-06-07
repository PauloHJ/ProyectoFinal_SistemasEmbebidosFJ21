`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:05:20 06/06/2021
// Design Name:   AddRoundKey
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/AddRoundKey_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AddRoundKey
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AddRoundKey_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En_ARK;
	reg [127:0] In_ARK;
	reg [127:0] Key_ARK;

	// Outputs
	wire Ry_ARK;
	wire [127:0] Out_ARK;

	// Instantiate the Unit Under Test (UUT)
	AddRoundKey uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En_ARK(En_ARK), 
		.Ry_ARK(Ry_ARK), 
		.In_ARK(In_ARK), 
		.Out_ARK(Out_ARK), 
		.Key_ARK(Key_ARK)
	);

	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	
	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En_ARK = 0;
		In_ARK = 0;
		Key_ARK = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		
		//test0
		En_ARK	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_ARK == 0'b0) 
			begin
			$display("***PassRedy0***");
			end
		else 
			begin
			$display("***ERROR0: Ry_ARK = %h and must be  0***",Ry_ARK);
			end 
		
		In_ARK	=	128'h328831e0435a3137f6309807a88da234;
		Key_ARK	=	128'h2b28ab097eaef7cf15d2154f16a6883c;
		En_ARK	=	1;#20;
		if (Out_ARK ==128'h19a09ae93df4c6f8e3e28d48be2b2a08 && Ry_ARK == 0'b1) 
			begin
			$display("***PassRoundKey0***");
			end
		else 
			begin
			$display("***ERROR RoundKey0: Out_ARK = %h and must be  19a09ae93df4c6f8e3e28d48be2b2a08***",Out_ARK);
			end 
		//test1
		En_ARK	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_ARK == 0'b0) 
			begin
			$display("***PassRedy1***");
			end
		else 
			begin
			$display("***ERROR1: Ry_ARK = %h and must be  0***",Ry_ARK);
			end 
		
		In_ARK	=	128'h04e0482866cbf8068119d326e59a7a4c;
		Key_ARK	=	128'ha088232afa54a36cfe2c397617b13905;
		En_ARK	=	1;#20;
		if (Out_ARK ==128'ha4686b029c9f5b6a7f35ea50f22b4349&& Ry_ARK == 0'b1) 
			begin
			$display("***PassRoundKey1***");
			end
		else 
			begin
			$display("***ERROR RoundKey1: Out_ARK = %h and must be  a4686b029c9f5b6a7f35ea50f22b4349***",Out_ARK);
			end 		
	end
      
endmodule

