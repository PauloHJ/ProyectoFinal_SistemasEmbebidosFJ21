`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:09:32 06/06/2021
// Design Name:   Controller
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/Controller_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Controller_VTF;

	// Inputs
	reg SerialReadRy;
	reg SerialWriteRy;
	reg EncRy;
	reg KeyRy;
	reg DecRy;
	reg Clk;
	reg Rst;
	reg OutRy;

	// Outputs
	wire SerialReadEn;
	wire SerialWriteEn;
	wire EncEn;
	wire DecEn;
	wire KeyEn;
	wire OutEn;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.SerialReadEn(SerialReadEn), 
		.SerialWriteEn(SerialWriteEn), 
		.EncEn(EncEn), 
		.DecEn(DecEn), 
		.KeyEn(KeyEn), 
		.SerialReadRy(SerialReadRy), 
		.SerialWriteRy(SerialWriteRy), 
		.EncRy(EncRy), 
		.KeyRy(KeyRy), 
		.DecRy(DecRy), 
		.Clk(Clk), 
		.Rst(Rst), 
		.OutEn(OutEn), 
		.OutRy(OutRy)
	);
//clock


	always
	begin
	  #10 Clk = ~Clk; #10 Clk = ~Clk;
	end;

	initial begin
		// Initialize Inputs
		SerialReadRy = 0;
		SerialWriteRy = 0;
		EncRy = 0;
		KeyRy = 0;
		DecRy = 0;
		Clk = 0;
		Rst = 0;
		OutRy = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test enable read serial
		Rst = 1;#20;Rst = 0;#40;
		if (SerialReadEn ==1'b1 && KeyEn == 1'b0  && EncEn  == 1'b0 && DecEn  == 1'b0 && OutEn  == 1'b0 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test enable read serial***");
			end
		else 
			begin
			$display("***ERROR test enable read serial:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end
		//test enable key
		SerialReadRy=1'b1;#40;
				if (SerialReadEn ==1'b0 && KeyEn == 1'b1  && EncEn  == 1'b0 && DecEn  == 1'b0 && OutEn  == 1'b0 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test enable key***");
			end
		else 
			begin
			$display("***ERROR test enable key:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end 
		//test enable Encriptor
		KeyRy=1'b1;#40;
				if (SerialReadEn ==1'b0 && KeyEn == 1'b0  && EncEn  == 1'b1 && DecEn  == 1'b0 && OutEn  == 1'b0 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test enable Encriptor***");
			end
		else 
			begin
			$display("***ERROR test enable Encriptor:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end 
		//test enable Decriptor
		EncRy=1'b1;#40;
				if (SerialReadEn ==1'b0 && KeyEn == 1'b0  && EncEn  == 1'b0 && DecEn  == 1'b1 && OutEn  == 1'b0 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test enable Decriptor***");
			end
		else 
			begin
			$display("***ERROR test enable Decriptor:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end 
		//test enable Out
		DecRy=1'b1;#40;
				if (SerialReadEn ==1'b0 && KeyEn == 1'b0  && EncEn  == 1'b0 && DecEn  == 1'b0 && OutEn  == 1'b1 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test enable Out***");
			end
		else 
			begin
			$display("***ERROR test enable Out:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end 		
	

		//test enable write
		OutRy=1'b1;#40;
				if (SerialReadEn ==1'b0 && KeyEn == 1'b0  && EncEn  == 1'b0 && DecEn  == 1'b0 && OutEn  == 1'b0 && SerialWriteEn == 1'b1) 
			begin
			$display("***Pass test enable write***");
			end
		else 
			begin
			$display("***ERROR test enable write:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end 
	  //test reset
		SerialReadRy = 0;
		EncRy = 0;
		KeyRy = 0;
		DecRy = 0;
		OutRy = 0;
		SerialWriteRy = 1;
		#40;
		if (SerialReadEn ==1'b1 && KeyEn == 1'b0  && EncEn  == 1'b0 && DecEn  == 1'b0 && OutEn  == 1'b0 && SerialWriteEn == 1'b0) 
			begin
			$display("***Pass test restart***");
			end
		else 
			begin
			$display("***ERROR test  restart:SerialReadEn = %b,KeyEn=%b,EncEn=%b,DecEn=%b,OutEn=%b,SerialWriteEn=%b ***",SerialReadEn,KeyEn,EncEn,DecEn,OutEn,SerialWriteEn);
			end
			
			
			
	end
      
endmodule

