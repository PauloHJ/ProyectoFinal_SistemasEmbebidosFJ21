`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:03 06/05/2021 
// Design Name: 
// Module Name:    Serial 
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
module Serial(
    input Rx,
    output reg Tx,
    input [127:0] Result,
    output reg [127:0] PT,
    input Clk,
    input Rst,
    input WriteEn,
    input ReadEn,
    output reg WriteRy,
    output reg ReadRy
    );
    // Freq dividers constants
    parameter DesiredFreq = 9600;
    parameter DesiredFreqX2 = DesiredFreq * 3;
    parameter BoardFreq = 100000000; //Nexys3
    parameter Bits = 27; // 2^Bits = BoardFreq
    parameter MaxCount    = BoardFreq / DesiredFreq;
    parameter MaxCountX2    = BoardFreq / DesiredFreqX2;
    // Freq dividers signals
    reg [Bits - 1: 0] count;
    reg [Bits - 1: 0] count2;
    reg En9600Hz;
    reg En316800Hz;
    // Serial receiver signals
    reg [29:0] ShiftReg;
    reg [29:0] register;
    reg [7:0] dataByte;
    reg [127:0] output_aux;
    reg byteReady;
    reg [4:0] byteCounter;
    reg outputReady;
    // Serial transmitter signals
    reg [10:0] TxBuffer;
    reg [4:0] byteCounterTx;
    reg loadNewByte;
    reg [3:0] bitCounter;
    reg sendingIsDone;
    reg readyToSend;
    reg [127:0] resultRegister;
    // Freq divider 19200 (9600 x 2)
    always @(posedge Clk) begin
        if (Rst) begin
            count = 0;
            En316800Hz = 1'b0;
        end
        else begin
            if (count !=  MaxCountX2 - 1) begin
                count = count + 1'b1;
                En316800Hz = 1'b0;
            end
            else begin
                count = 0;
                En316800Hz = 1'b1;
            end
        end
    end
    // Freq divider 9600
    always @(posedge Clk) begin
        if (Rst) begin
            count2 = 0;
            En9600Hz = 1'b0;
        end
        else begin
            if (count2 !=  MaxCount - 1) begin
                count2 = count2 + 1'b1;
                En9600Hz = 1'b0;
            end
            else begin
                count2 = 0;
                En9600Hz = 1'b1;
            end
        end
    end
    // Serial receiver
    always @(posedge Clk) begin
        if (Rst) begin
            ShiftReg = 30'h3FFF_FFFF;
            register = 30'h0000_0000;
            byteReady = 1'b0;
        end
        else if (En316800Hz == 1'b1 && ReadEn) begin
            ShiftReg = {Rx, ShiftReg[29:1]};  // push Rx to most significant bit of ShiftReg
            if (ShiftReg[0] == 1'b0) begin
                register = ShiftReg;
                ShiftReg = 30'h3FFF_FFFF;
                byteReady = 1'b1;
            end
            else begin
                byteReady = 1'b0;
            end
        end
    end
    // Get byte from register
    always @(negedge Clk) begin
        if (Rst) begin
            dataByte = 8'h00;
            byteCounter = 0;
            outputReady = 1'b0;
        end
        else if (ReadEn == 1'b0) begin
            dataByte = 8'h00;
            byteCounter = 0;
            outputReady = 1'b0;
        end
        else if (En316800Hz == 1'b1 && byteReady == 1'b1) begin
            dataByte = {register[25], register[22], register[19], register[16], register[13], register[10], register[7], register[4]};
            // push the byte into aux output
            output_aux = {dataByte[7:0], output_aux[127:8]};
            byteCounter = byteCounter + 1'b1;
            if (byteCounter == 16) begin
                byteCounter = 0;
                outputReady = 1'b1;
            end
            else
                outputReady = 1'b0;
        end
    end
    // put output in port
    always @(posedge Clk) begin
        if (Rst) begin
            PT = 0;
            ReadRy = 1'b0;
        end
        else if (ReadEn == 1'b0) begin
            ReadRy = 1'b0;
        end
        else if (outputReady == 1'b1) begin
            PT = output_aux;
            ReadRy = 1'b1;
        end
        else
            ReadRy = 1'b0;
    end
    // Serial transmitter handle
    always @(posedge Clk) begin
        if (Rst) begin
            Tx = 1'b1;
            TxBuffer = 0;
            WriteRy = 1'b0;
            byteCounterTx = 0;
            loadNewByte = 1'b1;
            bitCounter = 0;
            sendingIsDone = 1'b0;
            readyToSend = 1'b0;
        end
        else if (WriteEn == 1'b1 && En9600Hz == 1'b1 && sendingIsDone == 1'b0 && readyToSend == 1'b1) begin
            if (loadNewByte == 1'b1) begin
                TxBuffer = {1'b1, resultRegister[7:0], 2'b01};
                loadNewByte = 1'b0;
                bitCounter = 0;
            end
            else begin
                if (bitCounter != 11) begin
                    Tx = TxBuffer[0];
                    TxBuffer = {1'b1, TxBuffer[10:1]};
                    bitCounter = bitCounter + 1;
                end
                else begin
                    loadNewByte = 1'b1;
                    if (byteCounterTx == 15) begin
                        sendingIsDone = 1'b1;
                        byteCounterTx = 0;
                        WriteRy = 1'b1;
                    end
                    else begin
                        byteCounterTx = byteCounterTx + 1;
                        sendingIsDone = 1'b0;
                        resultRegister = {8'hFF, resultRegister[127:8]};
                    end
                end
            end
        end
        else if (WriteEn == 1'b0) begin
            Tx = 1'b1;
            TxBuffer = 0;
            WriteRy = 1'b0;
            byteCounterTx = 0;
            loadNewByte = 1'b1;
            bitCounter = 0;
            sendingIsDone = 1'b0;
            readyToSend = 1'b0;
        end
        else begin
            if (readyToSend == 1'b0) begin
                resultRegister = Result;
                readyToSend = 1'b1;
            end
        end
    end
endmodule 