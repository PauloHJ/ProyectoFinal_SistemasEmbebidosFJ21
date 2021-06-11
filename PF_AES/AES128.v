module AES128 (ProgramSelector, UserText, Key, ReadyKey, ReadRy, WriteRy, Clk,
  Rst, ReadEn, WriteEn, Result) ;
  input      ProgramSelector;
  input      [127:0]UserText;
  input      [127:0]Key;
  input      ReadyKey;
  input      ReadRy;
  input      WriteRy;
  input      Clk;
  input      Rst;
  output     ReadEn;
  output     WriteEn;
  output     [127:0]Result;


  wire [127:0]PT;
  wire [127:0]CT;
  wire Ry;
  wire KeyEn;
  wire u1_Ry;
  wire EncEn;
  wire u2_Ry;
  wire DecEn;
  wire [3:0]SelKey;
  wire [3:0]u2_SelKey;
  wire [3:0]u1_SelKey;
  wire [127:0]u4_Key;
  wire u5_Ry;
  wire OutEn;
  wire RstKey;
  wire RstProgram;
  wire RstEncryptorOk;
  wire RstEncryptor;
  wire ProgramRunning;

  assign RstEncryptorOk = RstEncryptor | Rst;


  OutputSelector
    u5(
      .Sel(ProgramSelector),
      .PT(PT),
      .CT(CT),
      .Result(Result),
      .En(OutEn),
      .Ry(u5_Ry),
	  .Clk(Clk),
      .Rst(RstProgram));

  AES_Encryptor
    u1(
      .PT(UserText),
      .Clk(Clk),
      .Rst(RstEncryptorOk),
      .En(EncEn),
      .Ry(u1_Ry),
      .CT(CT),
      .Key(u4_Key),
      .SelKey(u1_SelKey));

  AES_Decryptor
    u2(
      .CT(UserText),
      .Clk(Clk),
      .Rst(RstProgram),
      .En(DecEn),
      .Ry(u2_Ry),
      .Key(u4_Key),
      .PT(PT),
      .SelKey(u2_SelKey));

  Controller
    u3(
      .SerialReadEn(ReadEn),
      .EncEn(EncEn),
      .DecEn(DecEn),
      .KeyEn(KeyEn),
      .SerialWriteRy(WriteRy),
      .SerialKeyRy(ReadyKey),
      .EncRy(u1_Ry),
      .KeyRy(Ry),
      .DecRy(u2_Ry),
      .Clk(Clk),
      .Rst(Rst),
      .RstEncryptor(RstEncryptor),
      .RstKey(RstKey),
      .SerialWriteEn(WriteEn),
      .OutEn(OutEn),
      .OutRy(u5_Ry),
      .SerialReadRy(ReadRy),
      .ProgramSelector(ProgramSelector),
      .ProgramRunning(ProgramRunning)
      );

  Key_Scheduler
    u4(
	  .RyK(ReadyKey),
      .Clk(Clk),
      .Rst(RstKey|Rst),
      .En(KeyEn),
      .Ry(Ry),
      .Key(u4_Key),
      .SelKey(SelKey),
      .KeySeed(Key));

  Key_Selector
    u6(
      .SelKeyEnc(u1_SelKey),
      .SelKeyDec(u2_SelKey),
      .SelKey(SelKey),
      .EncEn(EncEn),
      .DecEn(DecEn));

  LogicReset
      u9(
        .Rst(Rst),
        .ReadyKey(ProgramRunning),
        .RstKey(RstProgram));

endmodule // AES128
