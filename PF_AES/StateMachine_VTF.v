`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:50:54 06/06/2021
// Design Name:   StateMachine
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/StateMachine_VTF.v
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
	reg [127:0] msg_in;

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
	wire [127:0] Tx_out;
	wire [3:0] KeySel;
	wire [3:0] msg_sel;
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
		.Tx_out(Tx_out), 
		.KeySel(KeySel), 
		.msg_sel(msg_sel), 
		.msg_in(msg_in), 
		.Ry(Ry)
	);
	
	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	always @(posedge Clk)
		 begin
			if(Rst_ARK) Ry_ARK = 0;
			if(Rst_SBT) Ry_SBT = 0;
			if(Rst_SHR) Ry_SHR = 0;
			if(Rst_MXC) Ry_MXC = 0;

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
		msg_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Rst = 1;#20;
		
		Rst = 0;
		PT = 128'h328831e0435a3137f6309807a88da234;
		#20;
		En = 1;
		//test En_ARK R INPUT
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R INPUT***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R INPUT:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;
		
		////////////////////////Round 1
		//test En_SBT R1 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R1***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R1:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R1 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R1***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R1:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R1 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R1***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R1:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R1
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R1***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R1:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;
////////////////////////Round 2
		//test En_SBT R2 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R2***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R2:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R2 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R2***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R2:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R2 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R2***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R2:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R2
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R2***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R2:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;	

		////////////////////////Round 3
		//test En_SBT R3
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R3***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R3:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R3 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R3***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R3:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R3 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R3***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R3:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R3
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R3***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R3:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;
////////////////////////Round 4
		//test En_SBT R4 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R4***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R4:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R4 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R4***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R4:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R4 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R4***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R4:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R5
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R5***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R5:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;	
		////////////////////////Round 6
		//test En_SBT R1 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R6***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R6:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R6 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R6***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R6:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R6 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R6***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R6:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R6
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R6***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R6:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;
////////////////////////Round 7
		//test En_SBT R7 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R7***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R7:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R7 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R7***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R7:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R7 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R7***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R7:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R7
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R7***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R7:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;	

		////////////////////////Round 8
		//test En_SBT R3
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R8***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R8:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R8
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R8***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R8:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R8 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R8***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R8:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R8
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R8***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R8:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;
////////////////////////Round 9
		//test En_SBT R9 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R9***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R9:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R9 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R9***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R9:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_MXC R9
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b1 ) 
			begin
			$display("***Pass test enable En_MXC R9***");
			end
		else 
			begin
			$display("***ERROR test En_MXC R9:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_MXC=1;
		//test En_ARK R9
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R9***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R9:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;	
////////////////////////Round 10
		//test En_SBT R10 
		if (En_ARK ==1'b0 && En_SBT == 1'b1  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SBT R10***");
			end
		else 
			begin
			$display("***ERROR test En_SBT R10:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SBT=1;

		//test En_SHR R10 
		if (En_ARK ==1'b0 && En_SBT == 1'b0  && En_SHR  == 1'b1 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_SHR R10***");
			end
		else 
			begin
			$display("***ERROR test En_SHR R10:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_SHR=1;
		//test En_ARK R10
		if (En_ARK ==1'b1 && En_SBT == 1'b0  && En_SHR  == 1'b0 && En_MXC  == 1'b0 ) 
			begin
			$display("***Pass test enable En_ARK R10***");
			end
		else 
			begin
			$display("***ERROR test En_ARK R10:En_ARK = %b,En_SBT=%b, En_SHR=%b,En_MXC=%b ***",En_ARK,En_SBT, En_SHR,En_MXC);
			end
		#40;Ry_ARK=1;	

		
	end
      
endmodule

