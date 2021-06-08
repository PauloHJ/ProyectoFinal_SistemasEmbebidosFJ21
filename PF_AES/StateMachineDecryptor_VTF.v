`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:00:39 06/07/2021
// Design Name:   StateMachineDecryptor
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/StateMachineDecryptor_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachineDecryptor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StateMachineDecryptor_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En;
	reg [127:0] CT;
	reg AddRy;
	reg SubRy;
	reg ShiftRy;
	reg MixRy;
	reg [127:0] ModifiedText;

	// Outputs
	wire [3:0] SelKey;
	wire Ry;
	wire [127:0] PT;
	wire AddEn;
	wire SubEn;
	wire ShiftEn;
	wire MixEn;
	wire [127:0] Text;

	// Instantiate the Unit Under Test (UUT)
	StateMachineDecryptor uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En(En), 
		.CT(CT), 
		.SelKey(SelKey), 
		.Ry(Ry), 
		.PT(PT), 
		.AddEn(AddEn), 
		.SubEn(SubEn), 
		.ShiftEn(ShiftEn), 
		.MixEn(MixEn), 
		.AddRy(AddRy), 
		.SubRy(SubRy), 
		.ShiftRy(ShiftRy), 
		.MixRy(MixRy), 
		.Text(Text), 
		.ModifiedText(ModifiedText)
	);

	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;

	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En = 0;
		CT = 0;
		AddRy = 0;
		SubRy = 0;
		ShiftRy = 0;
		MixRy = 0;
		ModifiedText = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Add stimulus here
		Rst = 1; #20; Rst = 0; #20; 
		En = 1;
	
		#220;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #220;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
		
		SubRy = 0; ShiftRy = 1; MixRy = 0; AddRy = 0; #120;
		SubRy = 1; ShiftRy = 0; MixRy = 0; AddRy = 0; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 0; AddRy = 1; #120;
		SubRy = 0; ShiftRy = 0; MixRy = 1; AddRy = 0; #120;
	end
      
endmodule

