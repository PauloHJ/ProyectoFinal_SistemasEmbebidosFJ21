`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:33:08 06/07/2021
// Design Name:   InvMixColumns
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/InvMixColumns_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InvMixColumns
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InvMixColumns_VTF;

	// Inputs
	reg Mix_En;
	reg Clk;
	reg [127:0] Text;

	// Outputs
	wire [127:0] Modified_Text;
	wire Mix_Ry;

	// Instantiate the Unit Under Test (UUT)
	InvMixColumns uut (
		.Mix_En(Mix_En), 
		.Clk(Clk), 
		.Text(Text), 
		.Modified_Text(Modified_Text), 
		.Mix_Ry(Mix_Ry)
	);
	
	// Clock generator
	always
	begin
	  #10 Clk = ~Clk;
	end

	initial begin
		// Initialize Inputs
		Mix_En = 0;
		Clk = 0;
		Text = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test0
		Mix_En	=	0;#20;
		if (Mix_Ry == 0'b0)
			begin
			$display("***PassRedy0***");
			end
		else
			begin
			$display("***ERROR0: Mix_Ry = %h and must be  0***",Mix_Ry);
			end
		
		Text	=	128'h97e148ee8a20178b8142d22fc379353c;
		Mix_En	=	1;#20;
		if (Modified_Text ==128'h64a9a7e632f001d9cce556cbc5464882 && Mix_Ry == 0'b1)
			begin
			$display("***PassInvMixy0***");
			end
		else
			begin
			$display("***ERROR InvMix0: Modified_Text = %h and must be  h64a9a7e632f001d9cce556cbc5464882***",Modified_Text);
			end
		//test1
		Mix_En	=	0;#20;
		if (Mix_Ry == 0'b0)
			begin
			$display("***PassRedy1***");
			end
		else
			begin
			$display("***ERROR1: Mix_Ry = %h and must be  0***",Mix_Ry);
			end
		
		Text	=	128'h6602b88a372c3c84cae3d203b9067128;
		Mix_En	=	1;#20;
		if (Modified_Text ==128'h6b3e1c92f1c8d001835238513b6fd3e7 && Mix_Ry == 0'b1)
			begin
			$display("***Pass InvMix1**");
			end
		else
			begin
			$display("***ERROR InvMix1: Modified_Text = %h and must be  h6b3e1c92f1c8d001835238513b6fd3e7***",Modified_Text);
			end 		

	end
      
endmodule

