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


  wire ProgramSelector;
  wire [127:0]PT;
  wire [127:0]Key;
  wire ReadyKey;
  wire [127:0]Result;
  wire ReadRy;
  wire WriteRy;
  wire ReadEn;
  wire WriteEn;

//  reg [127:0] MUserText;
//  reg [127:0] MKey;
//  reg MReadyKey;
//  reg MReadRy;
//  reg MProgramSelector;
//
//  initial
//  begin
//    MReadyKey = 1;
//    MUserText = 128'h328831e0435a3137f6309807a88da234;
//    MKey = 128'h2b28ab097eaef7cf15d2154f16a6883c;
//    MProgramSelector = 0;
//  end


  Serial
    u0(
      .Rx(Rx),
      .Tx(Tx),
      .PT(PT),
      .Clk(Clk),
      .Rst(Rst),
      .Result(Result),
      .ReadEn(ReadEn),
      .WriteRy(WriteRy),
      .WriteEn(WriteEn),
      .ReadRy(ReadRy),
      .Key(Key),
      .KeyRy(ReadyKey),
      .Encrypting(ProgramSelector));

 // 100Mhz / 9600
  AES128
    u8(
      .ProgramSelector(ProgramSelector),
      .UserText(PT),
      .Key(Key),
      .ReadyKey(ReadyKey),
      .ReadRy(ReadRy),
      .WriteRy(WriteRy),
      .Clk(Clk),
      .Rst(Rst),
      .ReadEn(ReadEn),
      .WriteEn(WriteEn),
      .Result(Result));

endmodule // Top

