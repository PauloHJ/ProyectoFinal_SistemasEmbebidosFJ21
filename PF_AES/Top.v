`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:59:21 05/28/2021 
// Design Name: 
// Module Name:    Top 
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
module Top(
    input      Clk,
    input      Rst, 
    input      Switch,
    input      Rx,
    output     Tx 
    );
	 
	 //Emmbeded Signals
	 wire KeyEn;
    wire Ry;
    wire u2_Ry;
    wire u1_Ry;
    wire SerialEn;
    wire u0_Ry;
    wire SerialWriteEn;
    wire OutEn;
    wire u5_Ry;
    wire EncEn;
	 wire DecEn;
	 wire [127:0]u0_PT;
	 wire [127:0]CT;
	 wire [127:0]PT;
	 wire [127:0]Result;
	 wire [3:0]u6_SelKey;
	 wire [127:0]Key;
	 wire [3:0]u1_SelKey;
	 wire [3:0]SelKey;
	 wire ReadRy;

  //Module 0: Serial
  Serial
    u0(
      .Rx(Rx),
      .Tx(Tx),
      .PT(u0_PT),
      .Clk(Clk),
      .Rst(Rst),
      .Result(Result),
      .ReadEn(SerialEn),
      .WriteRy(u0_Ry),
      .WriteEn(SerialWriteEn),
      .ReadRy(ReadRy));

  //Module 1: Encoder
  AES_Encryptor
    u1(
      .PT(u0_PT),
      .Clk(Clk),
      .Rst(Rst),
      .En(EncEn),
      .Ry(u1_Ry),
      .CT(CT),
      .Key(Key),
      .SelKey(u1_SelKey));

  //Module 2: Decoder	
  AES_Decryptor
    u2(
      .CT(CT),
      .Clk(Clk),
      .Rst(Rst),
      .En(DecEn),
      .Ry(u2_Ry),
      .Key(Key),
      .PT(PT),
      .SelKey(SelKey));
  
  //Module 3: STM
  Controller
    u3(
      .SerialReadEn(SerialEn),
      .EncEn(EncEn),
      .DecEn(DecEn),
      .KeyEn(KeyEn),
      .SerialWriteRy(u0_Ry),
      .EncRy(u1_Ry),
      .KeyRy(Ry),
      .DecRy(u2_Ry),
      .Clk(Clk),
      .Rst(Rst),
      .SerialWriteEn(SerialWriteEn),
      .OutEn(OutEn),
      .OutRy(u5_Ry),
      .SerialReadRy(ReadRy));
   
  //Module 4: Key Scheduler
  Key_Scheduler
    u4(
      .Clk(Clk),
      .Rst(Rst),
      .En(KeyEn),
      .Ry(Ry),
      .Key(Key),
      .SelKey(u6_SelKey));
  
  //Module 5: OutputSelector
  OutputSelector
    u5(
      .Sel(Switch),
      .PT(PT),
      .CT(CT),
      .Result(Result),
      .En(OutEn),
      .Ry(u5_Ry));

  //Module 6: Key Selector
  Key_Selector
    u6(
      .SelKeyEnc(u1_SelKey),
      .SelKeyDec(SelKey),
      .SelKey(u6_SelKey),
      .EncEn(EncEn),
      .DecEn(DecEn));

endmodule
