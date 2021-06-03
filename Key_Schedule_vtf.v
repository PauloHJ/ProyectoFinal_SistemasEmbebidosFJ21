`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   16:28:46 05/29/2021
// Design Name:   Key_Schedule
// Module Name:   C:/Sist_Emb/Final_Project_KeySchedule/Key_Schedule_vtf.v
// Project Name:  Final_Project_KeySchedule
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: Key_Schedule
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////
module Key_Schedule_vtf;
	// Inputs
	reg En;
	reg [3:0] SelKey;
	reg Clk;
	reg Rst;
	// Outputs
	wire [127:0] Key;
	wire Ry;
	// Instantiate the Unit Under Test (UUT)
	Key_Schedule uut (
		.En(En),
		.SelKey(SelKey),
		.Clk(Clk),
		.Rst(Rst),
		.Key(Key),
		.Ry(Ry)
	);
	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;
	
	
	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 0;
		En = 0;
		SelKey = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		Rst = 1; En = 1; #50;
		Rst = 0; #100
		SelKey = 4'b0000; #150;
		SelKey = 4'b0001; #200;
		SelKey = 4'b0001; #250;
		SelKey = 4'b0010; #300;
		SelKey = 4'b0011; #350;
		SelKey = 4'b0100; #400;
		SelKey = 4'b0101; #450;
		SelKey = 4'b0110; #500;
		SelKey = 4'b0111; #550;
		SelKey = 4'b1000; #600;
		SelKey = 4'b1001; #650;
		SelKey = 4'b1010; #700;
	end
endmodule