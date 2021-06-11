`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:06:47 06/09/2021
// Design Name:   AES128
// Module Name:   C:/AES Final/PF_AES/AES128_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AES128
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AES128_VTF;

	// Inputs
	reg ProgramSelector;
	reg [127:0] UserText;
	reg [127:0] Key;
	reg ReadyKey;
	reg ReadRy;
	reg WriteRy;
	reg Clk;
	reg Rst;

	// Outputs
	wire ReadEn;
	wire WriteEn;
	wire [127:0] Result;

	// Instantiate the Unit Under Test (UUT)
	AES128 uut (
		.ProgramSelector(ProgramSelector), 
		.UserText(UserText), 
		.Key(Key), 
		.ReadyKey(ReadyKey), 
		.ReadRy(ReadRy), 
		.WriteRy(WriteRy), 
		.Clk(Clk), 
		.Rst(Rst), 
		.ReadEn(ReadEn), 
		.WriteEn(WriteEn), 
		.Result(Result)
	);
	
	// Clock generator
    always
    begin
      #10 Clk = ~Clk; #10 Clk = ~Clk;
    end

	initial begin
		// Initialize Inputs
		ProgramSelector = 0;
		UserText = 0;
		Key = 0;
		ReadyKey = 0;
		ReadRy = 0;
		WriteRy = 0;
		Clk = 0;
		Rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ProgramSelector = 1;
		Rst = 1;
        #30
        Rst = 0;
        #90
        UserText = 128'h328831e0435a3137f6309807a88da234;
		Key = 128'h2b28ab097eaef7cf15d2154f16a6883c;
		ReadyKey = 1;
		ReadRy = 1;
	end
      
endmodule

