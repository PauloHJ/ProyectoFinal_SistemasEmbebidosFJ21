`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:43:22 06/06/2021
// Design Name:   Key_Selector
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/Key_Selector_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Key_Selector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Key_Selector_VTF;

	// Inputs
	reg [3:0] SelKeyEnc;
	reg [3:0] SelKeyDec;
	reg DecEn;
	reg EncEn;

	// Outputs
	wire [3:0] SelKey;

	// Instantiate the Unit Under Test (UUT)
	Key_Selector uut (
		.SelKeyEnc(SelKeyEnc), 
		.SelKeyDec(SelKeyDec), 
		.DecEn(DecEn), 
		.EncEn(EncEn), 
		.SelKey(SelKey)
	);

	initial begin
		// Initialize Inputs
		SelKeyEnc = 0;
		SelKeyDec = 0;
		DecEn = 0;
		EncEn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Wait 100 ns for global reset to finish
		#100;
		//FIRST TEST
		SelKeyEnc = 4'b0000;SelKeyDec = 4'b1011; 
		DecEn = 1;EncEn = 0;#100
		if (SelKey == 4'b1011) 
			begin
			$display("***Pass1***");
			end
		else 
			begin
			$display("***ERROR1: SelKey = %b and must be  4'b1011***",SelKey);
			end 
		// Add stimulus here
		EncEn = 1;DecEn = 0;#100
		if (SelKey == 4'b0000) 
			begin
			$display("***Pass2***");
			end
		else 
			begin
			$display("***ERROR2: SelKey = %b and must be  4'b0000***",SelKey);
			end 
		//SECOND TEST
		SelKeyEnc = 4'b0010;SelKeyDec = 4'b1001; 
		DecEn = 1;EncEn = 0;#100
		if (SelKey == 4'b1001) 
			begin
			$display("***Pass3***");
			end
		else 
			begin
			$display("***ERROR3: SelKey = %b and must be  4'b1001***",SelKey);
			end 
		// Add stimulus here
		EncEn = 1;DecEn = 0;#100
		if (SelKey == 4'b0010) 
			begin
			$display("***Pass4***");
			end
		else 
			begin
			$display("***ERROR4: SelKey = %b and must be  4'b0010***",SelKey);
			end 
		//THIRD TEST
		SelKeyEnc = 4'b0100;SelKeyDec = 4'b0001; 
		DecEn = 1;EncEn = 0;#100
		if (SelKey == 4'b0001) 
			begin
			$display("***Pass5***");
			end
		else 
			begin
			$display("***ERROR5: SelKey = %b and must be  4'b0001***",SelKey);
			end 
		// Add stimulus here
		EncEn = 1;DecEn = 0;#100
		if (SelKey == 4'b0100) 
			begin
			$display("***Pass6***");
			end
		else 
			begin
			$display("***ERROR6: SelKey = %b and must be  4'b0100***",SelKey);
			end 
	end

      
endmodule

