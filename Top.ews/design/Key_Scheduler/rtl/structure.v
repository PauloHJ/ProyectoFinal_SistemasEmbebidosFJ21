// EASE/HDL begin //////////////////////////////////////////////////////////////
// 
// module 'Key_Scheduler'.
// 
////////////////////////////////////////////////////////////////////////////////

module Key_Scheduler (Clk, Rst, En, Ry, Key, SelKey, KeySeed) ;
  input      Clk;
  input      Rst;
  input      En;
  output     Ry;
  output     [127:0]Key;
  input      [3:0]SelKey;
  input      [127:0]KeySeed;


// EASE/HDL end ////////////////////////////////////////////////////////////////



endmodule // Key_Scheduler
