`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:57:53 06/06/2021
// Design Name:   OutputSelector
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/OutputSelector_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: OutputSelector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module OutputSelector_VTF;

	// Inputs
	reg Sel;
	reg Rst;
	reg [127:0] PT;
	reg [127:0] CT;
	reg En;

	// Outputs
	wire [127:0] Result;
	wire Ry;

	// Instantiate the Unit Under Test (UUT)
	OutputSelector uut (
		.Sel(Sel), 
		.Rst(Rst), 
		.PT(PT), 
		.CT(CT), 
		.Result(Result), 
		.En(En), 
		.Ry(Ry)
	);

	initial begin
		// Initialize Inputs
		Sel = 0;
		Rst = 0;
		PT = 0;
		CT = 0;
		En = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test 0
		#10;Rst = 1'b1;#10;Rst = 1'b0;Sel = 1'b0;
		PT = 128'h03c18e199ba5296289328eca914a59aa;
		CT = 128'h5b448dd8c1beb2c7653f07f878c2c8e0;
		En=1'b1;
		#10;
		if (Result ==128'h03c18e199ba5296289328eca914a59aa) 
			begin
			$display("***PassResult0***");
			end
		else 
			begin
			$display("***ERROR0: Result = %h and must be  03c18e199ba5296289328eca914a59aa***",Result);
			end
		En=1'b0;
		//test 1
		#10;Rst = 1'b1;#10;Rst = 1'b0;Sel = 1'b1;
		PT = 128'h03c18e199ba5296289328eca914a59aa;
		CT = 128'h5b448dd8c1beb2c7653f07f878c2c8e0;
		En=1'b1;
		#10;
		if (Result ==128'h5b448dd8c1beb2c7653f07f878c2c8e0) 
			begin
			$display("***PassResult1***");
			end
		else 
			begin
			$display("***ERROR1: Result = %h and must be  5b448dd8c1beb2c7653f07f878c2c8e0***",Result);
			end 		
		En=1'b0;	
		
	end
      
endmodule

