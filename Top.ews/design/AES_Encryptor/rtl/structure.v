// EASE/HDL begin //////////////////////////////////////////////////////////////
// 
// module 'AES_Encryptor'.
// 
////////////////////////////////////////////////////////////////////////////////

module AES_Encryptor (PT, Clk, Rst, En, Ry, CT, Key, SelKey) ;
  input      [127:0]PT;
  input      Clk;
  input      Rst;
  input      En;
  output     Ry;
  output     [127:0]CT;
  input      [127:0]Key;
  output     signed [3:0]SelKey;


// EASE/HDL end ////////////////////////////////////////////////////////////////



endmodule // AES_Encryptor
