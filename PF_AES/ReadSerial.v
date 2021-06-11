`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:17:00 06/04/2021 
// Design Name: 
// Module Name:    ReadSerial 
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
module ReadSerial(
    input Rx,
    input Clk,
    input Rst,
    input ReadEn,
    output reg [7:0] outputByte,
    output reg outputReady
    );

    // Freq dividers constants
    parameter DesiredFreq = 9600 * 3;
    parameter BoardFreq = 100000000; //Nexys3
    parameter Bits = 12; // 2^Bits = BoardFreq
    parameter MaxCount    = BoardFreq / DesiredFreq;
    // Freq dividers signals
    reg [Bits - 1: 0] count;
    reg EnFreqHz;

    // Serial receiver signals
    reg [29:0] ShiftReg;
    reg [29:0] register;

    // Freq divider 19200 (9600 x 2)
    always @(posedge Clk) begin
        if (Rst) begin
            count = 0;
            EnFreqHz = 1'b1;
        end
        else begin
            if (count !=  MaxCount - 1) begin
                count = count + 1'b1;
                EnFreqHz = 1'b0;
            end
            else begin
                count = 0;
                EnFreqHz = 1'b1;
            end
        end
    end

    // Serial receiver
    always @(posedge Clk) begin
        if (Rst) begin
            ShiftReg = 30'h3FFF_FFFF;
            register = 30'h0000_0000;
            outputReady = 1'b0;
        end
        else if (EnFreqHz == 1'b1 && ReadEn) begin
            if (ShiftReg[1] == 1'b0) begin
                register = {Rx, ShiftReg[29:1]};  // push Rx to most significant bit of ShiftReg
                ShiftReg = 30'h3FFF_FFFF;
                outputByte = {register[25], register[22], register[19], register[16], register[13], register[10], register[7], register[4]};
                outputReady = 1'b1;
            end else begin
                outputReady = 1'b0;
                ShiftReg = {Rx, ShiftReg[29:1]};  // push Rx to most significant bit of ShiftReg
            end
        end
        else if (ReadEn == 1'b0) begin
            ShiftReg = 30'h3FFF_FFFF;
            outputReady = 1'b0;
        end
        else begin
            outputReady = 1'b0;
        end
    end

endmodule
