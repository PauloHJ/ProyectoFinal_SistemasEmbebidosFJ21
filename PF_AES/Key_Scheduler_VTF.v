`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:02:00 06/06/2021
// Design Name:   Key_Scheduler
// Module Name:   D:/Alexis/sistemasendebidos2/Proyects/PF_AES/Key_Scheduler_VTF.v
// Project Name:  PF_AES
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Key_Scheduler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Key_Scheduler_VTF;

	// Inputs
	reg En;
	reg [3:0] SelKey;
	reg Clk;
	reg Rst;
	reg RyK;
	reg [127:0] KeySeed;

	// Outputs
	wire [127:0] Key;
	wire Ry;

	// Instantiate the Unit Under Test (UUT)
	Key_Scheduler uut (
		.En(En), 
		.SelKey(SelKey), 
		.Clk(Clk), 
		.Rst(Rst), 
		.Key(Key), 
		.Ry(Ry),
		.RyK(RyK),
		.KeySeed(KeySeed)
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
		RyK = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Rst = 1; #50;
		KeySeed = 128'h2b28ab097eaef7cf15d2154f16a6883c;
		RyK = 1;
		Rst = 0; En = 1; #1500; SelKey = 4'b0000; #10;
		
		
		//if original key is 2b28ab097eaef7cf15d2154f16a6883c
		SelKey = 4'b0000; #150;//key0
		if (Key ==128'h2b28ab097eaef7cf15d2154f16a6883c) 
			begin
			$display("***PassKey0***");
			end
		else 
			begin
			$display("***ERROR0: Key = %h and must be  2b28ab097eaef7cf15d2154f16a6883c***",Key);
			end 
		SelKey = 4'b0001; #150;//key1
		if (Key ==128'ha088232afa54a36cfe2c397617b13905) 
			begin
			$display("***PassKey1***");
			end
		else 
			begin
			$display("***ERROR1: Key = %h and must be  a088232afa54a36cfe2c397617b13905***",Key);
			end 
			
		SelKey = 4'b0010; #150;//key2
		if (Key ==128'hf27a5973c296355995b980f6f2437a7f) 
			begin
			$display("***PassKey2***");
			end
		else 
			begin
			$display("***ERROR2: Key = %h and must be  f27a5973c296355995b980f6f2437a7f***",Key);
			end 
		SelKey = 4'b0011; #150;//key3
		if (Key ==128'h3d471e6d8016237a47fe7e887d3e443b) 
			begin
			$display("***PassKey3***");
			end
		else 
			begin
			$display("***ERROR3: Key = %h and must be  3d471e6d8016237a47fe7e887d3e443b***",Key);
			end 
		SelKey = 4'b0100; #150;//key4
		if (Key ==128'hefa8b6db4452710ba55b25ad417f3b00) 
			begin
			$display("***PassKey4***");
			end
		else 
			begin
			$display("***ERROR4: Key = %h and must be  efa8b6db4452710ba55b25ad417f3b00***",Key);
			end 
		SelKey = 4'b0101; #150;//key5
		if (Key ==128'hd47cca11d183f2f9c69db815f887bcbc) 
			begin
			$display("***PassKey5***");
			end
		else 
			begin
			$display("***ERROR5: Key = %h and must be  d47cca11d183f2f9c69db815f887bcbc***",Key);
			end 
		SelKey = 4'b0110; #150;//key6
		if (Key ==128'h6d11dbca880bf900a33e86937afd41fd) 
			begin
			$display("***PassKey6***");
			end
		else 
			begin
			$display("***ERROR6: Key = %h and must be  6d11dbca880bf900a33e86937afd41fd***",Key);
			end 
		SelKey = 4'b0111; #150;//key7
		if (Key ==128'h4e5f844e545fa6a6f7c94fdc0ef3b24f) 
			begin
			$display("***PassKey7***");
			end
		else 
			begin
			$display("***ERROR7: Key = %h and must be  4e5f844e545fa6a6f7c94fdc0ef3b24f***",Key);
			end 
		SelKey = 4'b1000; #150;
				//key8
		if (Key ==128'heab5317fd28d2b8d73baf52921d2602f) 
			begin
			$display("***PassKey8***");
			end
		else 
			begin
			$display("***ERROR8: Key = %h and must be  eab5317fd28d2b8d73baf52921d2602f***",Key);
			end 
		SelKey = 4'b1001; #150;//key9
		if (Key ==128'hac19285777fad15c66dc2900f321416e) 
			begin
			$display("***PassKey9***");
			end
		else 
			begin
			$display("***ERROR9: Key = %h and must be  ac19285777fad15c66dc2900f321416e***",Key);
			end 
		SelKey = 4'b1010; #150;//key10
		if (Key ==128'hd0c9e1b614ee3f63f9250c0ca889c8a6) 
			begin
			$display("***PassKey10***");
			end
		else 
			begin
			$display("***ERROR10: Key = %h and must be  d0c9e1b614ee3f63f9250c0ca889c8a6***",Key);
			end 
			
		//if original key is e6fad5a09c3ecf681b31e5d8e3aa15916
		/*SelKey = 4'b0000; #150;//key0
		if (Key ==128'he6fad5a0c3ecf681b31e5d8e3aa15916) 
			begin
			$display("***PassKey0***");
			end
		else 
			begin
			$display("***ERROR0: Key = %h and must be  he6fad5a0c3ecf681b31e5d8e3aa15916***",Key);
			end 
		SelKey = 4'b0001; #150;//key1
		if (Key ==128'heb11c464da36c041f4eab739da7b2234) 
			begin
			$display("***PassKey1***");
			end
		else 
			begin
			$display("***ERROR1: Key = %h and must be  eb11c464da36c041f4eab739da7b2234***",Key);
			end 
			
		SelKey = 4'b0010; #150;//key2
		if (Key ==128'h6a7bbfdbc8fe3e7fec06b18899e2c0f4) 
			begin
			$display("***PassKey2***");
			end
		else 
			begin
			$display("***ERROR2: Key = %h and must be  6a7bbfdbc8fe3e7fec06b18899e2c0f4***",Key);
			end 
		SelKey = 4'b0011; #150;//key3
		if (Key ==128'hbcc778a30cf2ccb35355e46c20c202f6) 
			begin
			$display("***PassKey3***");
			end
		else 
			begin
			$display("***ERROR3: Key = %h and must be  bcc778a30cf2ccb35355e46c20c202f6***",Key);
			end 
		SelKey = 4'b0100; #150;//key4
		if (Key ==128'hd91e66c55cae62d11144a0cc2ae8ea1c) 
			begin
			$display("***PassKey4***");
			end
		else 
			begin
			$display("***ERROR4: Key = %h and must be  d91e66c55cae62d11144a0cc2ae8ea1c***",Key);
			end 
		SelKey = 4'b0101; #150;//key5
		if (Key ==128'hf7e98f4a17b9db0a8dc969a58c648e92) 
			begin
			$display("***PassKey5***");
			end
		else 
			begin
			$display("***ERROR5: Key = %h and must be  f7e98f4a17b9db0a8dc969a58c648e92***",Key);
			end 
		SelKey = 4'b0110; #150;//key6
		if (Key ==128'hb059d69c11a87379c20b62c75a3eb022) 
			begin
			$display("***PassKey6***");
			end
		else 
			begin
			$display("***ERROR6: Key = %h and must be  b059d69c11a87379c20b62c75a3eb022***",Key);
			end 
		SelKey = 4'b0111; #150;//key7
		if (Key ==128'h461fc955d77f0c75515a38ff84ba0a28) 
			begin
			$display("***PassKey7***");
			end
		else 
			begin
			$display("***ERROR7: Key = %h and must be  461fc95d77f0c75515a38ff84ba0a28***",Key);
			end 
		SelKey = 4'b1000; #150;
				//key8
		if (Key ==128'h5b448dd8c1beb2c7653f07f878c2c8e0) 
			begin
			$display("***PassKey8***");
			end
		else 
			begin
			$display("***ERROR8: Key = %h and must be  5b448dd8c1beb2c7653f07f878c2c8e0***",Key);
			end 
		SelKey = 4'b1001; #150;//key9
		if (Key ==128'h86c24f97803e8c4b84bbbc4419db13f3) 
			begin
			$display("***PassKey9***");
			end
		else 
			begin
			$display("***ERROR9: Key = %h and must be  86c24f97803e8c4b84bbbc4419db13f3***",Key);
			end 
		SelKey = 4'b1010; #150;//key10
		if (Key ==128'h03c18e199ba5296289328eca914a59aa) 
			begin
			$display("***PassKey10***");
			end
		else 
			begin
			$display("***ERROR10: Key = %h and must be  03c18e199ba5296289328eca914a59aa***",Key);
			end 			
			
			
			
			
			

   */
	end
      
endmodule

