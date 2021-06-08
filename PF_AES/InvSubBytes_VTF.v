`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:27 06/07/2021
// Design Name:   InvSubBytes
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/InvSubBytes_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InvSubBytes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InvSubBytes_VTF;

	// Inputs
	reg En;
	reg [127:0] CT;

	// Outputs
	wire Ry;
	wire [127:0] CT_2;

	// Instantiate the Unit Under Test (UUT)
	InvSubBytes uut (
		.En(En), 
		.Ry(Ry), 
		.CT(CT), 
		.CT_2(CT_2)
	);

	initial begin
		// Initialize Inputs
		En = 0;
		CT = 0;

		// Wait 100 ns for global reset to finish
		#100;
       
		
		//test0
		En	=	0; #20;
		if (Ry == 1'b0) 
			begin
			$display("***PASS: Ready***");
			end
		else 
			begin
			$display("***ERROR0: Ry = %h and must be  0***", Ry);
			end
		
		CT	=	128'he241d056_5457b40e_940b0f15_046a9200;
		En	=	1;#20;
		if (CT_2 == 128'h3bf860b9_fddac6d7_e79efb2f_30587452 && Ry == 1'b1) 
			begin
			$display("***PassRoundKey0***");
			end
		else 
			begin
			$display("***ERROR RoundKey0: Out_ARK = %h and must be  3bf860b9_fddac6d7_e79efb2f_30587452***", CT_2);
			end 
		//test1
//		En_ARK	=	0;Rst = 1;#20;Rst = 0;#20;
//		if (Ry_ARK == 0'b0) 
//			begin
//			$display("***PassRedy1***");
//			end
//		else 
//			begin
//			$display("***ERROR1: Ry_ARK = %h and must be  0***",Ry_ARK);
//			end 
//		
//		In_ARK	=	128'h04e0482866cbf8068119d326e59a7a4c;
//		Key_ARK	=	128'ha088232afa54a36cfe2c397617b13905;
//		En_ARK	=	1;#20;
//		if (Out_ARK ==128'ha4686b029c9f5b6a7f35ea50f22b4349&& Ry_ARK == 0'b1) 
//			begin
//			$display("***PassRoundKey1***");
//			end
//		else 
//			begin
//			$display("***ERROR RoundKey1: Out_ARK = %h and must be  a4686b029c9f5b6a7f35ea50f22b4349***",Out_ARK);
//			end 		

	end
      
endmodule

