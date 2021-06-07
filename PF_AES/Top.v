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
module Top (Clk, Rst, Rx, Tx) ;
  input      Clk;
  input      Rst;
  input      Rx;
  output     Tx;


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
  wire ProgramSelector;
  wire [127:0]u0_Key;
  wire RstKey;
  wire ReadyKey;


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
      .ReadRy(ReadRy),
      .Key(u0_Key),
      .ReadyKey(ReadyKey),
      .ProgramSelector(ProgramSelector));

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

  AES_Decryptor
    u2(
      .CT(u0_PT),
      .Clk(Clk),
      .Rst(Rst),
      .En(DecEn),
      .Ry(u2_Ry),
      .Key(Key),
      .PT(PT),
      .SelKey(SelKey));

  Controller
    u3(
      .SeriaReadlEn(SerialEn),
      .EncEn(EncEn),
      .DecEn(DecEn),
      .KeyEn(KeyEn),
      .SeriaWriteRy(u0_Ry),
      .EncRy(u1_Ry),
      .KeyRy(Ry),
      .DecRy(u2_Ry),
      .Clk(Clk),
      .Rst(Rst),
      .SerialWriteEn(SerialWriteEn),
      .OutEn(OutEn),
      .OutRy(u5_Ry),
      .SerialReadRy(ReadRy),
      .ProgramSelector(ProgramSelector));

  OutputSelector
    u5(
      .Sel(ProgramSelector),
      .PT(PT),
      .CT(CT),
      .Result(Result),
      .En(OutEn),
      .Ry(u5_Ry),
      .Rst(Rst));

  Key_Scheduler
    u4(
      .Clk(Clk),
      .Rst(RstKey),
      .En(KeyEn),
      .Ry(Ry),
      .Key(Key),
      .SelKey(u6_SelKey),
      .KeySeed(u0_Key));

  Key_Selector
    u6(
      .SelKeyEnc(u1_SelKey),
      .SelKeyDec(SelKey),
      .SelKey(u6_SelKey),
      .EncEn(EncEn),
      .DecEn(DecEn));

  LogicReset
    u7(
      .Rst(Rst),
      .ReadyKey(ReadyKey),
      .RstKey(RstKey));

endmodule // Top
