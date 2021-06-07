`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:19:07 06/06/2021
// Design Name:   ShiftRows
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/ShiftRows_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftRows
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ShiftRows_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En_SHR;
	reg [127:0] In_SHR;

	// Outputs
	wire Ry_SHR;
	wire [127:0] Out_SHR;

	// Instantiate the Unit Under Test (UUT)
	ShiftRows uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En_SHR(En_SHR), 
		.Ry_SHR(Ry_SHR), 
		.In_SHR(In_SHR), 
		.Out_SHR(Out_SHR)
	);

   always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En_SHR = 0;
		In_SHR = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test0
		En_SHR	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_SHR == 1'b0) 
			begin
			$display("***PassRedy0***");
			end
		else 
			begin
			$display("***ERROR0: Ry_SHR = %h and must be  0***",Ry_SHR);
			end 
		
		In_SHR	=	128'hd4e0b81e27bfb44111985d52aef1e530;
		En_SHR	=	1;#20;
		if (Out_SHR ==128'hd4e0b81ebfb441275d52119830aef1e5 && Ry_SHR == 1'b1) 
			begin
			$display("***Pass shift0***");
			end
		else 
			begin
			$display("***ERROR shift0: Out_ARK = %h and must be  hd4e0b81ebfb441275d52119830aef1e5***",Out_SHR);
			end 
		//test1
		En_SHR	=	0;Rst = 1;#20;Rst = 0;#20;
		if (Ry_SHR == 1'b0) 
			begin
			$display("***PassRedy1***");
			end
		else 
			begin
			$display("***ERROR1: Ry_SHR = %h and must be  0***",Ry_SHR);
			end 
		
		In_SHR	=	128'h49457f77dedb3902d296875389f11a3b;
		En_SHR	=	1;#20;
		if (Out_SHR ==128'h49457f77db3902de8753d2963b89f11a && Ry_SHR == 1'b1) 
			begin
			$display("***Pass shift1***");
			end
		else 
			begin
			$display("***ERROR shift1: Out_ARK = %h and must be  h49457f77db3902de8753d2963b89f11a***",Out_SHR);
			end 	

	end
      
endmodule

