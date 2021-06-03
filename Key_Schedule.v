`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:44:56 05/26/2021
// Design Name:
// Module Name:    KeySchedule
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module Key_Schedule(
    input 				En,		//Enable
    input 	[3:0] 	SelKey, 	//Key request
	 input 				Clk,		//Clock
	 input 				Rst,		//Reset
    output  [127:0] 	Key, 		//Key Value
    output reg			Ry			//End or ready
    );
	 
	 
	 // Embedded signals
	 reg [7:0] 		expanded_key		[0:175];
	 reg [7:0] 		Key_temp     		[0:15];
		
	 integer j;
	 integer c;
	 integer z;
	 genvar k;
	 
	 
	 //Constants
	 // Original key
	 reg [7:0] original_key	[0:15]; 
	 reg [7:0] SBox [0:255];  
	reg  [7:0] Rcon [0:9];
	 
	 
//	 reg [7:0] original_key	[0:15] = { 
//							8'h2b, 8'h7e, 8'h15, 8'h16, 
//							8'h28, 8'hae, 8'hd2, 8'ha6, 
//							8'hab, 8'hf7, 8'h15, 8'h88, 
//							8'h09, 8'hcf, 8'h4f, 8'h3c};
	
	initial begin
		original_key[0] = 8'h2b;
		original_key[1] = 8'h7e;
		original_key[2] = 8'h15;
		original_key[3] = 8'h16;
		original_key[4] = 8'h28;
		original_key[5] = 8'hae;
		original_key[6] = 8'hd2;
		original_key[7] = 8'ha6;
		original_key[8] = 8'hab;
		original_key[9] = 8'hf7;
		original_key[10] = 8'h15;
		original_key[11] = 8'h88;
		original_key[12] = 8'h09;
		original_key[13] = 8'hcf;
		original_key[14] = 8'h4f;
		original_key[15] = 8'h3c;
			
		//SBox	
		SBox[0] = 8'h63;
		SBox[1] = 8'h7c;
		SBox[2] = 8'h77;
		SBox[3] = 8'h7b;
		SBox[4] = 8'hf2;
		SBox[5] = 8'h6b;
		SBox[6] = 8'h6f;
		SBox[7] = 8'hc5;
		SBox[8] = 8'h30;
		SBox[9] = 8'h01;
		SBox[10] = 8'h67;
		SBox[11] = 8'h2b;
		SBox[12] = 8'hfe;
		SBox[13] = 8'hd7;
		SBox[14] = 8'hab;
		SBox[15] = 8'h76;
		SBox[16] = 8'hca;
		SBox[17] = 8'h82;
		SBox[18] = 8'hc9;
		SBox[19] = 8'h7d;
		SBox[20] = 8'hfa;
		SBox[21] = 8'h59;
		SBox[22] = 8'h47;
		SBox[23] = 8'hf0;
		SBox[24] = 8'had;
		SBox[25] = 8'hd4;
		SBox[26] = 8'ha2;
		SBox[27] = 8'haf;
		SBox[28] = 8'h9c;
		SBox[29] = 8'ha4;
		SBox[30] = 8'h72;
		SBox[31] = 8'hc0;
		SBox[32] = 8'hb7;
		SBox[33] = 8'hfd;
		SBox[34] = 8'h93;
		SBox[35] = 8'h26;
		SBox[36] = 8'h36;
		SBox[37] = 8'h3f;
		SBox[38] = 8'hf7;
		SBox[39] = 8'hcc;
		SBox[40] = 8'h34;
		SBox[41] = 8'ha5;
		SBox[42] = 8'he5;
		SBox[43] = 8'hf1;
		SBox[44] = 8'h71;
		SBox[45] = 8'hd8;
		SBox[46] = 8'h31;
		SBox[47] = 8'h15;
		SBox[48] = 8'h04;
		SBox[49] = 8'hc7;
		SBox[50] = 8'h23;
		SBox[51] = 8'hc3;
		SBox[52] = 8'h18;
		SBox[53] = 8'h96;
		SBox[54] = 8'h05;
		SBox[55] = 8'h9a;
		SBox[56] = 8'h07;
		SBox[57] = 8'h12;
		SBox[58] = 8'h80;
		SBox[59] = 8'he2;
		SBox[60] = 8'heb;
		SBox[61] = 8'h27;
		SBox[62] = 8'hb2;
		SBox[63] = 8'h75;
		SBox[64] = 8'h09;
		SBox[65] = 8'h83;
		SBox[66] = 8'h2c;
		SBox[67] = 8'h1a;
		SBox[68] = 8'h1b;
		SBox[69] = 8'h6e;
		SBox[70] = 8'h5a;
		SBox[71] = 8'ha0;
		SBox[72] = 8'h52;
		SBox[73] = 8'h3b;
		SBox[74] = 8'hd6;
		SBox[75] = 8'hb3;
		SBox[76] = 8'h29;
		SBox[77] = 8'he3;
		SBox[78] = 8'h2f;
		SBox[79] = 8'h84;
		SBox[80] = 8'h53;
		SBox[81] = 8'hd1;
		SBox[82] = 8'h00;
		SBox[83] = 8'hed;
		SBox[84] = 8'h20;
		SBox[85] = 8'hfc;
		SBox[86] = 8'hb1;
		SBox[87] = 8'h5b;
		SBox[88] = 8'h6a;
		SBox[89] = 8'hcb;
		SBox[90] = 8'hbe;
		SBox[91] = 8'h39;
		SBox[92] = 8'h4a;
		SBox[93] = 8'h4c;
		SBox[94] = 8'h58;
		SBox[95] = 8'hcf;
		SBox[96] = 8'hd0;
		SBox[97] = 8'hef;
		SBox[98] = 8'haa;
		SBox[99] = 8'hfb;
		SBox[100] = 8'h43;
		SBox[101] = 8'h4d;
		SBox[102] = 8'h33;
		SBox[103] = 8'h85;
		SBox[104] = 8'h45;
		SBox[105] = 8'hf9;
		SBox[106] = 8'h02;
		SBox[107] = 8'h7f;
		SBox[108] = 8'h50;
		SBox[109] = 8'h3c;
		SBox[110] = 8'h9f;
		SBox[111] = 8'ha8;
		SBox[112] = 8'h51;
		SBox[113] = 8'ha3;
		SBox[114] = 8'h40;
		SBox[115] = 8'h8f;
		SBox[116] = 8'h92;
		SBox[117] = 8'h9d;
		SBox[118] = 8'h38;
		SBox[119] = 8'hf5;
		SBox[120] = 8'hbc;
		SBox[121] = 8'hb6;
		SBox[122] = 8'hda;
		SBox[123] = 8'h21;
		SBox[124] = 8'h10;
		SBox[125] = 8'hff;
		SBox[126] = 8'hf3;
		SBox[127] = 8'hd2;
		SBox[128] = 8'hcd;
		SBox[129] = 8'h0c;
		SBox[130] = 8'h13;
		SBox[131] = 8'hec;
		SBox[132] = 8'h5f;
		SBox[133] = 8'h97;
		SBox[134] = 8'h44;
		SBox[135] = 8'h17;
		SBox[136] = 8'hc4;
		SBox[137] = 8'ha7;
		SBox[138] = 8'h7e;
		SBox[139] = 8'h3d;
		SBox[140] = 8'h64;
		SBox[141] = 8'h5d;
		SBox[142] = 8'h19;
		SBox[143] = 8'h73;
		SBox[144] = 8'h60;
		SBox[145] = 8'h81;
		SBox[146] = 8'h4f;
		SBox[147] = 8'hdc;
		SBox[148] = 8'h22;
		SBox[149] = 8'h2a;
		SBox[150] = 8'h90;
		SBox[151] = 8'h88;
		SBox[152] = 8'h46;
		SBox[153] = 8'hee;
		SBox[154] = 8'hb8;
		SBox[155] = 8'h14;
		SBox[156] = 8'hde;
		SBox[157] = 8'h5e;
		SBox[158] = 8'h0b;
		SBox[159] = 8'hdb;
		SBox[160] = 8'he0;
		SBox[161] = 8'h32;
		SBox[162] = 8'h3a;
		SBox[163] = 8'h0a;
		SBox[164] = 8'h49;
		SBox[165] = 8'h06;
		SBox[166] = 8'h24;
		SBox[167] = 8'h5c;
		SBox[168] = 8'hc2;
		SBox[169] = 8'hd3;
		SBox[170] = 8'hac;
		SBox[171] = 8'h62;
		SBox[172] = 8'h91;
		SBox[173] = 8'h95;
		SBox[174] = 8'he4;
		SBox[175] = 8'h79;
		SBox[176] = 8'he7;
		SBox[177] = 8'hc8;
		SBox[178] = 8'h37;
		SBox[179] = 8'h6d;
		SBox[180] = 8'h8d;
		SBox[181] = 8'hd5;
		SBox[182] = 8'h4e;
		SBox[183] = 8'ha9;
		SBox[184] = 8'h6c;
		SBox[185] = 8'h56;
		SBox[186] = 8'hf4;
		SBox[187] = 8'hea;
		SBox[188] = 8'h65;
		SBox[189] = 8'h7a;
		SBox[190] = 8'hae;
		SBox[191] = 8'h08;
		SBox[192] = 8'hba;
		SBox[193] = 8'h78;
		SBox[194] = 8'h25;
		SBox[195] = 8'h2e;
		SBox[196] = 8'h1c;
		SBox[197] = 8'ha6;
		SBox[198] = 8'hb4;
		SBox[199] = 8'hc6;
		SBox[200] = 8'he8;
		SBox[201] = 8'hdd;
		SBox[202] = 8'h74;
		SBox[203] = 8'h1f;
		SBox[204] = 8'h4b;
		SBox[205] = 8'hbd;
		SBox[206] = 8'h8b;
		SBox[207] = 8'h8a;
		SBox[208] = 8'h70;
		SBox[209] = 8'h3e;
		SBox[210] = 8'hb5;
		SBox[211] = 8'h66;
		SBox[212] = 8'h48;
		SBox[213] = 8'h03;
		SBox[214] = 8'hf6;
		SBox[215] = 8'h0e;
		SBox[216] = 8'h61;
		SBox[217] = 8'h35;
		SBox[218] = 8'h57;
		SBox[219] = 8'hb9;
		SBox[220] = 8'h86;
		SBox[221] = 8'hc1;
		SBox[222] = 8'h1d;
		SBox[223] = 8'h9e;
		SBox[224] = 8'he1;
		SBox[225] = 8'hf8;
		SBox[226] = 8'h98;
		SBox[227] = 8'h11;
		SBox[228] = 8'h69;
		SBox[229] = 8'hd9;
		SBox[230] = 8'h8e;
		SBox[231] = 8'h94;
		SBox[232] = 8'h9b;
		SBox[233] = 8'h1e;
		SBox[234] = 8'h87;
		SBox[235] = 8'he9;
		SBox[236] = 8'hce;
		SBox[237] = 8'h55;
		SBox[238] = 8'h28;
		SBox[239] = 8'hdf;
		SBox[240] = 8'h8c;
		SBox[241] = 8'ha1;
		SBox[242] = 8'h89;
		SBox[243] = 8'h0d;
		SBox[244] = 8'hbf;
		SBox[245] = 8'he6;
		SBox[246] = 8'h42;
		SBox[247] = 8'h68;
		SBox[248] = 8'h41;
		SBox[249] = 8'h99;
		SBox[250] = 8'h2d;
		SBox[251] = 8'h0f;
		SBox[252] = 8'hb0;
		SBox[253] = 8'h54;
		SBox[254] = 8'hbb;
		SBox[255] = 8'h16;
		
		//Rcon
		Rcon[0] = 8'h01;
		Rcon[1] = 8'h02;
		Rcon[2] = 8'h04;
		Rcon[3] = 8'h08;
		Rcon[4] = 8'h10;
		Rcon[5] = 8'h20;
		Rcon[6] = 8'h40;
		Rcon[7] = 8'h80;
		Rcon[8] = 8'h1B;
		Rcon[9] = 8'h36;
		

//		//Intialize the expanded key with the original key
//		for (j = 0; j < 16; j = j + 1)
//		begin
//			expanded_key[j] = original_key[j];
//		end
//		
//		//Intialize the expanded key with 0's
//		for (j = 16; j < 176; j = j + 1)
//		begin
//			expanded_key[j] = 8'h00;
//		end
		
	end//Initial ends here
	
	
	
	 //S-box
//	 parameter [7:0] SBox 			[0:255] = {	
//							8'h63,8'h7c,8'h77,8'h7b,8'hf2,8'h6b,8'h6f,8'hc5,8'h30,8'h01,8'h67,8'h2b,8'hfe,8'hd7,8'hab,8'h76,
//							8'hca,8'h82,8'hc9,8'h7d,8'hfa,8'h59,8'h47,8'hf0,8'had,8'hd4,8'ha2,8'haf,8'h9c,8'ha4,8'h72,8'hc0,
//							8'hb7,8'hfd,8'h93,8'h26,8'h36,8'h3f,8'hf7,8'hcc,8'h34,8'ha5,8'he5,8'hf1,8'h71,8'hd8,8'h31,8'h15,
//							8'h04,8'hc7,8'h23,8'hc3,8'h18,8'h96,8'h05,8'h9a,8'h07,8'h12,8'h80,8'he2,8'heb,8'h27,8'hb2,8'h75,
//							8'h09,8'h83,8'h2c,8'h1a,8'h1b,8'h6e,8'h5a,8'ha0,8'h52,8'h3b,8'hd6,8'hb3,8'h29,8'he3,8'h2f,8'h84,
//							8'h53,8'hd1,8'h00,8'hed,8'h20,8'hfc,8'hb1,8'h5b,8'h6a,8'hcb,8'hbe,8'h39,8'h4a,8'h4c,8'h58,8'hcf,
//							8'hd0,8'hef,8'haa,8'hfb,8'h43,8'h4d,8'h33,8'h85,8'h45,8'hf9,8'h02,8'h7f,8'h50,8'h3c,8'h9f,8'ha8,
//							8'h51,8'ha3,8'h40,8'h8f,8'h92,8'h9d,8'h38,8'hf5,8'hbc,8'hb6,8'hda,8'h21,8'h10,8'hff,8'hf3,8'hd2,
//							8'hcd,8'h0c,8'h13,8'hec,8'h5f,8'h97,8'h44,8'h17,8'hc4,8'ha7,8'h7e,8'h3d,8'h64,8'h5d,8'h19,8'h73,
//							8'h60,8'h81,8'h4f,8'hdc,8'h22,8'h2a,8'h90,8'h88,8'h46,8'hee,8'hb8,8'h14,8'hde,8'h5e,8'h0b,8'hdb,
//							8'he0,8'h32,8'h3a,8'h0a,8'h49,8'h06,8'h24,8'h5c,8'hc2,8'hd3,8'hac,8'h62,8'h91,8'h95,8'he4,8'h79,
//							8'he7,8'hc8,8'h37,8'h6d,8'h8d,8'hd5,8'h4e,8'ha9,8'h6c,8'h56,8'hf4,8'hea,8'h65,8'h7a,8'hae,8'h08,
//							8'hba,8'h78,8'h25,8'h2e,8'h1c,8'ha6,8'hb4,8'hc6,8'he8,8'hdd,8'h74,8'h1f,8'h4b,8'hbd,8'h8b,8'h8a,
//							8'h70,8'h3e,8'hb5,8'h66,8'h48,8'h03,8'hf6,8'h0e,8'h61,8'h35,8'h57,8'hb9,8'h86,8'hc1,8'h1d,8'h9e,
//							8'he1,8'hf8,8'h98,8'h11,8'h69,8'hd9,8'h8e,8'h94,8'h9b,8'h1e,8'h87,8'he9,8'hce,8'h55,8'h28,8'hdf,
//							8'h8c,8'ha1,8'h89,8'h0d,8'hbf,8'he6,8'h42,8'h68,8'h41,8'h99,8'h2d,8'h0f,8'hb0,8'h54,8'hbb,8'h16};
	
//	parameter [7:0] Rcon 			[0:9]= {	
//							8'h01, 8'h02, 8'h04, 8'h08, 8'h10, 
//							8'h20, 8'h40, 8'h80, 8'h1B, 8'h36};


							
	

//	//Embedded signals init to avoid latches
//	for (k = 0; k < 16; k = k + 1)
//	begin
//				assign expanded_key[k] = 8'h00; 
//	end

//	// Initialize the first 16 blocks with the original key
//	integer j;
//	integer a;
//	integer x;
//	integer y;
//	integer z;
//	integer k;
//	
//	initial
//	begin
//		for (j = 0; j < 16; j = j + 1)
//			expanded_key[j] = original_key[j];
//			
//	   k = 0;
//	end	
//	
//	
//	genvar c;
//	generate
//	for (c = 16; c < 176; c = c+4)
//	begin: loop
//		always @(*)
//		begin
//			// Copy the last 4-byte block to the temporary array
//			for (a = 0; a < 4; a = a + 1)
//			begin
//				temp[a] = expanded_key[a+c-4]; 
//			end
//			
//			if (c%16 == 0)
//			begin
//				aux[k] = temp[k*4];
//				temp[k*4] = temp[k*4+1];
//				temp[k*4+1] = temp[k*4+2];
//				temp[k*4+2] = temp[k*4+3];
//				temp[k*4+3] = aux[k];	
//
//				for (x = 0; x < 4; x = x + 1)
//				begin
//					temp_aux[k*4+x] = temp[k*4+x];
//					temp[k*4+x] = Sbox[temp_aux[k*4+x]]; 
//				end
//				
////				//Adding (XOR) this result to the word 4 positions earlier plus a round constant Rcon
//				temp_aux_rcon[k*4] = temp[k*4];
//				temp[k*4] = temp_aux_rcon[k*4] ^ Rcon[i];
//				i = i + 1;
//				k = k + 1;
//			end
//			
////			//Adding (XOR) to the temp vector
////			for (y = 0; y < 4; y = y + 1)
////			begin
////				expanded_key_aux[c+y] = expanded_key[c+y-16];
////				expanded_key[c+y] = expanded_key_aux[c+y] ^ temp[y];
//				
////			end
//			
//		end
//	end
//	endgenerate



	always @(posedge(Clk))
	begin
		if(Rst)
		begin
			for (j = 0; j < 16; j = j + 1)
				expanded_key[j] = original_key[j];
			Ry = 0;

			//Intialize the expanded key with 0's
			for (j = 16; j < 176; j = j + 1)
				expanded_key[j] = 8'h00; 
		end
		else if(En)
		begin
			for (c = 16; c < 176; c = c + 16)
				begin
					expanded_key[c] = SBox[expanded_key[c-3]] ^ Rcon[c/16 - 1] ^ expanded_key[c-16];
					expanded_key[c + 1] = SBox[expanded_key[c-2]] ^ expanded_key[c-15];
					expanded_key[c + 2] = SBox[expanded_key[c-1]] ^ expanded_key[c-14];
					expanded_key[c + 3] = SBox[expanded_key[c-4]] ^ expanded_key[c-13];
					
					expanded_key[c + 4] = expanded_key[c] ^ expanded_key[c - 12];
					expanded_key[c + 5] = expanded_key[c + 1] ^ expanded_key[c - 11];
					expanded_key[c + 6] = expanded_key[c + 2] ^ expanded_key[c - 10];
					expanded_key[c + 7] = expanded_key[c + 3] ^ expanded_key[c - 9];
					
					expanded_key[c + 8] = expanded_key[c + 4] ^ expanded_key[c - 8];
					expanded_key[c + 9] = expanded_key[c + 5] ^ expanded_key[c - 7];
					expanded_key[c + 10] = expanded_key[c + 6] ^ expanded_key[c - 6];
					expanded_key[c + 11] = expanded_key[c + 7] ^ expanded_key[c - 5];
					
					expanded_key[c + 12] = expanded_key[c + 8] ^ expanded_key[c - 4];
					expanded_key[c + 13] = expanded_key[c + 9] ^ expanded_key[c - 3];
					expanded_key[c + 14] = expanded_key[c + 10] ^ expanded_key[c - 2];
					expanded_key[c + 15] = expanded_key[c + 11] ^ expanded_key[c - 1];
					
					
				end
				Ry = 1;
		end
		
		
		
		case(SelKey)
			4'b0000: begin 
							for (z = 0; z < 16; z = z + 1)
								Key_temp[z] = expanded_key[z];
						end
			4'b0001: begin 
							for (z = 16; z < 32; z = z + 1)
								Key_temp[z-16] = expanded_key[z];
						end
			4'b0010: begin 
							for (z = 32; z < 48; z = z + 1)
								Key_temp[z-32] = expanded_key[z];
						end
			4'b0011: begin 
							for (z = 48; z < 64; z = z + 1)
								Key_temp[z-48] = expanded_key[z];
						end
			4'b0100: begin 
							for (z = 64; z < 80; z = z + 1)
								Key_temp[z-64] = expanded_key[z];
						end
			4'b0101: begin 
							for (z = 80; z < 96; z = z + 1)
								Key_temp[z-80] = expanded_key[z];
						end
			4'b0110: begin 
							for (z = 96; z < 112; z = z + 1)
								Key_temp[z-96] = expanded_key[z];
						end
			4'b0111: begin
							for (z = 112; z < 128; z = z + 1)
								Key_temp[z-112] = expanded_key[z];
						end
			4'b1000: begin 
							for (z = 128; z < 144; z = z + 1)
								Key_temp[z-128] = expanded_key[z];
						end
			4'b1001: begin 
							for (z = 144; z < 160; z = z + 1)
								Key_temp[z-144] = expanded_key[z];
						end
			4'b1010: begin 
							for (z = 160; z < 176; z = z + 1)
								Key_temp[z-160] = expanded_key[z];
						end
			default: begin 
							for (z = 0; z < 16; z = z + 1)
								Key_temp[z] = expanded_key[z];
						end
		endcase
	
	
	end //Always ends here
	
	//Output
	assign Key[127:120] = Key_temp[0];
	assign Key[119:112] = Key_temp[1];
	assign Key[111:104] = Key_temp[2];
	assign Key[103:96]  = Key_temp[3];
	assign Key[95:88] =   Key_temp[4];
	assign Key[87:80] =   Key_temp[5];
	assign Key[79:72] =   Key_temp[6];
	assign Key[71:64] =   Key_temp[7];
	assign Key[63:56] =   Key_temp[8];
	assign Key[55:48] =   Key_temp[9];
	assign Key[47:40] =   Key_temp[10];
	assign Key[39:32] =   Key_temp[11];
	assign Key[31:24] =   Key_temp[12];
	assign Key[23:16] =   Key_temp[13];
	assign Key[15:8]    = Key_temp[14];
	assign Key[7:0]     = Key_temp[15];
	
//	//Alternatively:
//	for (k = 0; k < 15; k = k + 1)
//	begin
//		assign Key[127-(k*8):120-(k*8)] = Key_temp[k];
//	end
//	assign Key[7:0] = Key_temp[15];
	
endmodule

