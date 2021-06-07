`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:03:24 06/07/2021
// Design Name:   InvShiftRows
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/InvShiftRows_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InvShiftRows
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InvShiftRows_VTF;

	// Inputs
	reg ClkEn;
	reg [127:0] data;

	// Outputs
	wire [127:0] dataOut;
	wire Ry;

	// Instantiate the Unit Under Test (UUT)
	InvShiftRows uut (
		.ClkEn(ClkEn), 
		.data(data), 
		.dataOut(dataOut), 
		.Ry(Ry)
	);

	initial begin
		// Initialize Inputs
		ClkEn = 0;
		data = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test0
		ClkEn	=	0;#20;
		if (Ry == 1'b0)
			begin
			$display("***PassRedy0***");
			end
		else
			begin
			$display("***ERROR0: Ry = %h and must be  0***",Ry);
			end
		
		data =	128'he241d05657b40e540f15940b00046a92;
		ClkEn	=	1;#20;
		if (dataOut ==128'he241d0565457b40e940b0f15046a9200 && Ry == 1'b1)
			begin
			$display("***PassInvShiftRows0***");
			end
		else
			begin
			$display("***ERROR InvShiftRows0: dataOut = %h and must be  he241d0565457b40e940b0f15046a9200***",dataOut);
			end
		//test1
		ClkEn	=	0;#20;
		if (Ry == 1'b0)
			begin
			$display("***PassRedy1***");
			end
		else
			begin
			$display("***ERROR1: Ry = %h and must be  0***",Ry);
			end
		
		data =	128'h64a9a7e632f001d9cce556cbc5464882;
		ClkEn	=	1;#20;
		if (dataOut ==128'h64a9a7e6d932f00156cbcce5464882c5&& Ry == 1'b1)
			begin
			$display("***PassInvShiftRowsy1***");
			end
		else
			begin
			$display("***ERROR InvShiftRows1: dataOut = %h and must be  a4686b029c9f5b6a7f35ea50f22b4349***",dataOut);
			end 		
	end
      
endmodule

