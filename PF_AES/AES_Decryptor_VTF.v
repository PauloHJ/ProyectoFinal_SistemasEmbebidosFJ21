`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:30:48 06/07/2021
// Design Name:   AES_Decryptor
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/AES_Decryptor_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AES_Decryptor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AES_Decryptor_VTF;

	// Inputs
	reg Clk;
	reg Rst;
	reg En;
	reg [127:0] Key;
	reg [127:0] CT;

	// Outputs
	wire [3:0] SelKey;
	wire Ry;
	wire [127:0] PT;

	// Instantiate the Unit Under Test (UUT)
	AES_Decryptor uut (
		.Clk(Clk), 
		.Rst(Rst), 
		.En(En), 
		.Key(Key), 
		.CT(CT), 
		.SelKey(SelKey), 
		.Ry(Ry), 
		.PT(PT)
	);

	// Clock generator
	always
	begin
	  #10 Clk = ~Clk;
	end
	//Key
	always @( SelKey)
    begin
      case( SelKey )
          4'b0000: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
          4'b0001: Key = 128'ha088232afa54a36cfe2c397617b13905;
          4'b0010: Key = 128'hf27a5973c296355995b980f6f2437a7f;
          4'b0011: Key = 128'h3d471e6d8016237a47fe7e887d3e443b;
			 4'b0100: Key = 128'hefa8b6db4452710ba55b25ad417f3b00;
          4'b0101: Key = 128'hd47cca11d183f2f9c69db815f887bcbc;
          4'b0110: Key = 128'h6d11dbca880bf900a33e86937afd41fd;
          4'b0111: Key = 128'h4e5f844e545fa6a6f7c94fdc0ef3b24f;
          4'b1000: Key = 128'heab5317fd28d2b8d73baf52921d2602f;
          4'b1001: Key = 128'hac19285777fad15c66dc2900f321416e;
          4'b1010: Key = 128'hd0c9e1b614ee3f63f9250c0ca889c8a6;
          4'b1011: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
			 4'b1100: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
          4'b1101: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
          4'b1110: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
          4'b1111: Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
      endcase
    end

	always @(posedge Clk)
	begin
		if(Ry)
		begin
			En = 0;
		end
	end

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 0;
		En = 0;
		Key = 0;
		CT = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		CT = 128'h328831e0435a3137f6309807a88da234; #20;
		Rst = 1'b1;
		#100
		;Rst = 1'b0;
		#100;
		En = 1'b1;
		
		#20500;
		if (PT ==128'hcb1d0d0c1359113838c1f6ce9cd5b97f)
			begin
			$display("***PassKey***");
			end
		else
			begin
			$display("***ERROR0: PT = %h and must be  hcb1d0d0c1359113838c1f6ce9cd5b97f***",PT);
			end
		
		
		
		
//				// Add stimulus here
//		CT = 128'h3902dc1925dc116a8409850b1dfd9732; #20;
//		Rst = 1'b1;
//		#100
//		;Rst = 1'b0;
//		#100;
//		En = 1'b1;
//		
////		
//		#500;
//		if (PT ==128'hcb1d0d0c1359113838c1f6ce9cd5b97f)
//			begin
//			$display("***PassKey***");
//			end
//		else
//			begin
//			$display("***ERROR0: PT = %h and must be  hcb1d0d0c1359113838c1f6ce9cd5b97f***",PT);
//			end
	end
      
endmodule

