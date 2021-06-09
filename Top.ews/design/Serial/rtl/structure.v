// EASE/HDL begin //////////////////////////////////////////////////////////////
// 
// module 'Serial'.
// 
////////////////////////////////////////////////////////////////////////////////

module Serial (Rx, Tx, PT, Clk, Rst, Result, ReadEn, WriteRy, WriteEn, ReadRy, 
  Key, ReadyKey, ProgramSelector) ;
  input      Rx;
  output     Tx;
  output     [127:0]PT;
  input      Clk;
  input      Rst;
  input      [127:0]Result;
  input      ReadEn;
  output     WriteRy;
  input      WriteEn;
  output     ReadRy;
  output     [127:0]Key;
  output     ReadyKey;
  output     ProgramSelector;


// EASE/HDL end ////////////////////////////////////////////////////////////////



endmodule // Serial
