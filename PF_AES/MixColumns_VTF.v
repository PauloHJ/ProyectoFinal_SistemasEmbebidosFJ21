`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:44 06/06/2021
// Design Name:   MixColumns
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/MixColumns_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MixColumns
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MixColumns_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En_MXC;
	reg [127:0] In_MXC;

	// Outputs
	wire Ry_MXC;
	wire [127:0] Out_MXC;

	// Instantiate the Unit Under Test (UUT)
	MixColumns uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En_MXC(En_MXC), 
		.Ry_MXC(Ry_MXC), 
		.In_MXC(In_MXC), 
		.Out_MXC(Out_MXC)
	);

	 always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En_MXC = 0;
		In_MXC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test0
		En_MXC	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_MXC == 1'b0) 
			begin
			$display("***PassRedy0***");
			end
		else 
			begin
			$display("***ERROR0: Ry_MXC = %h and must be  0***",Ry_MXC);
			end 
		
		In_MXC	=	128'hd4e0b81ebfb441275d52119830aef1e5;
		En_MXC	=	1;#20;
		if (Out_MXC ==128'h04e0482866cbf8068119d326e59a7a4c && Ry_MXC == 1'b1) 
			begin
			$display("***Pass mix0***");
			end
		else 
			begin
			$display("***ERROR mix0: Out_ARK = %h and must be  h04e0482866cbf8098119d326e59a7a4c***",Out_MXC);
			end 
		//test1
		En_MXC	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_MXC == 1'b0) 
			begin
			$display("***PassRedy1***");
			end
		else 
			begin
			$display("***ERROR1: Ry_MXC = %h and must be  0***",Ry_MXC);
			end 
		
		In_MXC	=	128'h49457f77db3902de8753d2963b89f11a;
		En_MXC	=	1;#20;
		if (Out_MXC ==128'h581bdb1b4d4be76bca5acab0f1aca8e5 && Ry_MXC == 1'b1) 
			begin
			$display("***Pass mix1***");
			end
		else 
			begin
			$display("***ERROR mix1: Out_ARK = %h and must be  h49457f77db3902de8753d2963b89f11a***",Out_MXC);
			end 	

	end
      
endmodule

