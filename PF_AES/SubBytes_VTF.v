`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:32 06/06/2021
// Design Name:   SubBytes
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/SubBytes_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SubBytes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SubBytes_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En_SBT;
	reg [127:0] In_SBT;

	// Outputs
	wire Ry_SBT;
	wire [127:0] Out_SBT;

	// Instantiate the Unit Under Test (UUT)
	SubBytes uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En_SBT(En_SBT), 
		.Ry_SBT(Ry_SBT), 
		.In_SBT(In_SBT), 
		.Out_SBT(Out_SBT)
	);

   always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En_SBT = 0;
		In_SBT = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test0
		En_SBT	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_SBT == 1'b0) 
			begin
			$display("***PassRedy0***");
			end
		else 
			begin
			$display("***ERROR0: Ry_SBT = %h and must be  0***",Ry_SBT);
			end 
		
		In_SBT	=	128'h19a09ae93df4c6f8e3e28d48be2b2a08;
		En_SBT	=	1;#20;
		if (Out_SBT ==128'hd4e0b81e27bfb44111985d52aef1e530 && Ry_SBT == 1'b1) 
			begin
			$display("***Pass sub0***");
			end
		else 
			begin
			$display("***ERROR sub0: Out_ARK = %h and must be  hd4e0b81e27bfb44111985d52aef1e530***",Out_SBT);
			end 
		//test1
		En_SBT	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_SBT == 1'b0) 
			begin
			$display("***PassRedy1***");
			end
		else 
			begin
			$display("***ERROR1: Ry_SBT = %h and must be  0***",Ry_SBT);
			end 
		
		In_SBT	=	128'ha4686b029c9f5b6a7f35ea50f22b4349;
		En_SBT	=	1;#20;
		if (Out_SBT ==128'h49457f77dedb3902d296875389f11a3b && Ry_SBT == 1'b1) 
			begin
			$display("***Pass sub1***");
			end
		else 
			begin
			$display("***ERROR sub1: Out_ARK = %h and must be  h49457f77dedb3902d296875389f11a3b***",Out_SBT);
			end 	

	end
      
endmodule

