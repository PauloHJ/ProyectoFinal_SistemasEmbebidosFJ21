`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:58 06/04/2021 
// Design Name: 
// Module Name:    Write16Bytes 
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
module Write16Bytes(
    input [127:0] Result, // input
    output reg [7:0] ByteToWrite, // output
    output reg ByteReadyToWrite, // output
    output reg AllBytesDone,
    input ByteDone, // input
    input En, // input
    input Clk, // input
    input Rst // input
    );

    reg [4:0] byteCount;
    reg [119:0] auxResult;

    always @(negedge Clk) begin
        if (Rst) begin
            byteCount = 0;
            ByteReadyToWrite = 1'b0;
            ByteToWrite = 0;
            AllBytesDone = 1'b0;
            auxResult = 120'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
        end
        else if (En == 1'b1) begin
            if (byteCount == 0) begin
                auxResult = Result[119:0];
                ByteToWrite = Result[127:120];
                AllBytesDone = 1'b0;
                byteCount = byteCount + 1;
                ByteReadyToWrite = 1'b1;
            end
            else if (byteCount == 16) begin
                ByteReadyToWrite = 1'b0;
                if (ByteDone == 1'b1) begin
                    AllBytesDone = 1'b1;
                end else begin
                    AllBytesDone = 1'b0;
                end
            end
            else if (ByteDone == 1'b1) begin
                AllBytesDone = 1'b0;
                byteCount = byteCount + 1;
                ByteToWrite = auxResult[119:112];
                auxResult = {auxResult[111:0], 8'hFF};
                ByteReadyToWrite = 1'b1;
            end
            else begin
                ByteReadyToWrite = 1'b0;
                AllBytesDone = 1'b0;
            end
        end
        else begin
            byteCount = 0;
            ByteReadyToWrite = 1'b0;
            AllBytesDone = 1'b0;
        end
    end

endmodule
