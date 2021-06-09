// EASE/HDL begin //////////////////////////////////////////////////////////////
// 
// module 'Controller'.
// 
////////////////////////////////////////////////////////////////////////////////

module Controller (SeriaReadlEn, EncEn, DecEn, KeyEn, SeriaWriteRy, EncRy, 
  KeyRy, DecRy, Clk, Rst, SerialWriteEn, OutEn, OutRy, SerialReadRy, 
  ProgramSelector) ;
  output     SeriaReadlEn;
  output     EncEn;
  output     DecEn;
  output     KeyEn;
  input      SeriaWriteRy;
  input      EncRy;
  input      KeyRy;
  input      DecRy;
  input      Clk;
  input      Rst;
  output     SerialWriteEn;
  output     OutEn;
  input      OutRy;
  input      SerialReadRy;
  input      ProgramSelector;


// EASE/HDL end ////////////////////////////////////////////////////////////////



endmodule // Controller
