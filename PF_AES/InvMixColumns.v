`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:30 06/03/2021 
// Design Name: 
// Module Name:    InvMixColumns 
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
module InvMixColumns(
        input               Mix_En,
        input			    Clk,
        input       [127:0] Text,
        output reg  [127:0] Modified_Text,
        output reg		    Mix_Ry
    );

    reg [7:0] romE [0:255];
    reg [7:0] romB [0:255];
    reg [7:0] romD [0:255];
    reg [7:0] rom9 [0:255];
	 
    initial $readmemb("tablaE.data", romE);
    initial $readmemb("tablaB.data", romB);
    initial $readmemb("tablaD.data", romD);
    initial $readmemb("tabla9.data", rom9);

    reg [  7 : 0] a0, a1, a2, a3;
    reg [127 : 0] Output;

    integer i;
    always @(posedge(Clk))
    begin
        if (Mix_En)
        begin
            for (i = 0; i < 4; i = i + 1)
            begin
                a0 = Text[127 - i*8 -: 8];
                a1 = Text[095 - i*8 -: 8];
                a2 = Text[063 - i*8 -: 8];
                a3 = Text[031 - i*8 -: 8];

                Output[127 - i*8 -: 8] = romE[a0] ^ romB[a1] ^ romD[a2] ^ rom9[a3];
                Output[095 - i*8 -: 8] = rom9[a0] ^ romE[a1] ^ romB[a2] ^ romD[a3];
                Output[063 - i*8 -: 8] = romD[a0] ^ rom9[a1] ^ romE[a2] ^ romB[a3];
                Output[031 - i*8 -: 8] = romB[a0] ^ romD[a1] ^ rom9[a2] ^ romE[a3];
            end
            Mix_Ry = 1;
        end
        else
            Mix_Ry = 0;

    end

    always @(*)
    begin
        if (Mix_Ry)
        begin
            Modified_Text = Output;
        end
    end
endmodule
