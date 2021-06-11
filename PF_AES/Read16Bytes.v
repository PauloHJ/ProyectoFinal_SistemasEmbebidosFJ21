`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:25 06/04/2021 
// Design Name: 
// Module Name:    Read16Bytes 
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
module Read16Bytes(
    input [7:0] SingleByte, // input
    input ByteToReadReady, // input
    output reg [127:0] bytesOutput, // output
    output reg bytesReady, // output
    input Enable, // input
    input Clk,
    input Rst
    );

    reg [4:0] byteCount;
    reg [127:0] output_aux;

    always @(negedge Clk) begin
        if (Rst) begin
            bytesOutput = 0;
            bytesReady = 1'b0;
            byteCount = 0;
            output_aux = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
        end
        else if (Enable == 1'b1) begin
            if (byteCount == 16) begin
                // output is ready
                byteCount = 0;
                bytesOutput = output_aux;
                bytesReady = 1'b1;
            end
            else if (ByteToReadReady == 1'b1) begin
                bytesReady = 1'b0;
                output_aux = {output_aux[119:0], SingleByte[7:0]}; // shift the bytes to the left
                byteCount = byteCount + 1;
            end
        end
        else begin
            byteCount = 0;
            bytesReady = 1'b0;
        end
    end

endmodule
