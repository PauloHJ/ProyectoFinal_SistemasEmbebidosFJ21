`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:23:07 06/09/2021
// Design Name:   StateMachine
// Module Name:   L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/StateMachine_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module StateMachine_VTF;

	// Inputs
	reg Rst;
	reg Clk;
	reg En;
	reg [127:0] PT;
	reg Ry_ARK;
	reg Ry_SBT;
	reg Ry_SHR;
	reg Ry_MXC;
	reg [127:0] Text_ARK;
	reg [127:0] Text_SBT;
	reg [127:0] Text_SHR;
	reg [127:0] Text_MXC;

	// Outputs
	wire [127:0] CT;
	wire En_ARK;
	wire En_SBT;
	wire En_SHR;
	wire En_MXC;
	wire Rst_ARK;
	wire Rst_SBT;
	wire Rst_SHR;
	wire Rst_MXC;
	wire [127:0] Text;
	wire [3:0] KeySel;
	wire Ry;

	// Instantiate the Unit Under Test (UUT)
	StateMachine uut (
		.Rst(Rst), 
		.Clk(Clk), 
		.En(En), 
		.PT(PT), 
		.CT(CT), 
		.En_ARK(En_ARK), 
		.En_SBT(En_SBT), 
		.En_SHR(En_SHR), 
		.En_MXC(En_MXC), 
		.Rst_ARK(Rst_ARK), 
		.Rst_SBT(Rst_SBT), 
		.Rst_SHR(Rst_SHR), 
		.Rst_MXC(Rst_MXC), 
		.Ry_ARK(Ry_ARK), 
		.Ry_SBT(Ry_SBT), 
		.Ry_SHR(Ry_SHR), 
		.Ry_MXC(Ry_MXC), 
		.Text(Text), 
		.Text_ARK(Text_ARK), 
		.Text_SBT(Text_SBT), 
		.Text_SHR(Text_SHR), 
		.Text_MXC(Text_MXC), 
		.KeySel(KeySel), 
		.Ry(Ry)
	);

    always
    begin
      #10 Clk = ~Clk; #10 Clk = ~Clk;
    end


	initial begin
		// Initialize Inputs
		Rst = 0;
		Clk = 0;
		En = 0;
		PT = 0;
		Ry_ARK = 0;
		Ry_SBT = 0;
		Ry_SHR = 0;
		Ry_MXC = 0;
		Text_ARK = 0;
		Text_SBT = 0;
		Text_SHR = 0;
		Text_MXC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		PT = 128'h328831e0435a3137f6309807a88da234;
		Text_ARK = 128'h328831e0435a3137f6309807a88da234;
		Text_SBT = 128'hbbbbbbbbbbbbbbbbb6309807a88da234;
		Text_SHR = 128'hccccccccccccccccf6309807a88da234;
        Text_MXC = 128'h0001110000000007f6309807a88da234;

		Rst = 1; #20; Rst = 0; #20;
		En = 1;

		#220;
		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
		Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
        Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
		Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
        Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
		Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
        Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
		Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
        Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
		Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
		Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;

		Ry_ARK=1; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 0; #220;
        Ry_ARK=0; Ry_SBT = 1; Ry_SHR = 0; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 1; Ry_MXC = 0; #120;
        Ry_ARK=0; Ry_SBT = 0; Ry_SHR = 0; Ry_MXC = 1; #120;
	end
      
endmodule

