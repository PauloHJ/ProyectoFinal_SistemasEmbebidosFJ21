`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:36:36 06/04/2021 
// Design Name: 
// Module Name:    WriteSerial 
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
module WriteSerial(
    output reg Tx,
    input [7:0] writeByte,
    input Clk,
    input Rst,
    input WriteEn,
    input loadNewByte,
    output reg WriteByteReady
    );

    // Freq dividers constants
    parameter DesiredFreq = 9600;
    parameter BoardFreq = 100000000; //Nexys3
    parameter Bits = 27; // 2^Bits = BoardFreq
    parameter MaxCount    = BoardFreq / DesiredFreq;
    // Freq dividers signals
    reg [Bits - 1: 0] count;
    reg En9600Hz;

    // Serial transmitter signals
    reg [10:0] TxBuffer;
    reg [3:0] bitCounter;

    // Freq divider 9600
    always @(posedge Clk) begin
        if (Rst) begin
            count = 0;
            En9600Hz = 1'b0;
        end
        else begin
            if (count != MaxCount - 1) begin
                count = count + 1'b1;
                En9600Hz = 1'b0;
            end
            else begin
                count = 0;
                En9600Hz = 1'b1;
            end
        end
    end

    always @(posedge Clk) begin
        if (Rst) begin
            bitCounter = 0;
            WriteByteReady = 1'b0;
            Tx = 1'b1;
            TxBuffer = 11'b111_1111_1111;
        end
        else if (WriteEn == 1'b1) begin
            if (loadNewByte == 1'b1) begin
                TxBuffer = {1'b1, writeByte[7:0], 2'b01};
                bitCounter = 0;
                WriteByteReady = 1'b0;
            end
            else if (En9600Hz == 1'b1) begin
                if (bitCounter != 11) begin
                    Tx = TxBuffer[0];
                    TxBuffer = {1'b1, TxBuffer[10:1]};
                    bitCounter = bitCounter + 1;
                end
                else begin
                    WriteByteReady = 1'b1;
                end
            end
            else begin
                WriteByteReady = 1'b0;
            end
        end
        else begin
            WriteByteReady = 1'b0;
            bitCounter = 0;
        end
    end

endmodule
