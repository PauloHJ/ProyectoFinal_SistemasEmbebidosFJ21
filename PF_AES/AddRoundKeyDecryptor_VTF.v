`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:11:50 06/07/2021
// Design Name:   AddRoundKeyDecryptor
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/AddRoundKeyDecryptor_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AddRoundKeyDecryptor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AddRoundKeyDecryptor_VTF;

	// Inputs
	reg En;
	reg Clk;
	reg [127:0] Key;
	reg [127:0] Text;

	// Outputs
	wire Ry;
	wire [127:0] ModifiedText;

	// Instantiate the Unit Under Test (UUT)
	AddRoundKeyDecryptor uut (
		.En(En), 
		.Clk(Clk), 
		.Key(Key), 
		.Text(Text), 
		.Ry(Ry), 
		.ModifiedText(ModifiedText)
	);
	
	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;

	initial begin
		// Initialize Inputs
		En = 0;
		Clk = 0;
		Key = 0;
		Text = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
				//test0
		En	=	0; #20
		if (Ry == 1'b0) 
			begin
			$display("***PassRedy0***");
			end
		else 
			begin
			$display("***ERROR0: Ry = %h and must be  0***",Ry);
			end 
			
		En	= 0; #20;
		Key = 128'hd0c9e1b6_14ee3f63_f9250c0c_a889c8a6;
		Text = 128'h328831e0435a3137f6309807a88da234;
		En	= 1; #20;
		
		if (ModifiedText == 128'he241d05657b40e540f15940b00046a92 && Ry == 1'b1) 
			begin
			$display("***PassRedy1***");
			end
		else 
			begin
			$display("***ERROR0: ModifiedText = %h and must be  e241d05657b40e540f15940b00046a92***",ModifiedText);
			end 

		En	= 0; #20;
	end
      
endmodule

