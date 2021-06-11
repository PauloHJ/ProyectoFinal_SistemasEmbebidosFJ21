`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:02:04 06/04/2021 
// Design Name: 
// Module Name:    ReadCommand 
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
module ReadCommand(
    input [7:0] Command,
    input CommandToReadReady,
    output reg ReadingKey,
    output reg ReadingData,
    output reg Encrypting,
    output reg Ready,
    output reg ChangeEncrypting,
    output reg UnknownCommand,
    input En,
	input Clk,
	input Rst
    );

    always @(negedge Clk) begin
        if (Rst) begin
            ReadingKey = 1'b0;
            ReadingData = 1'b0;
            Encrypting = 1'b1;
            Ready = 1'b0;
            ChangeEncrypting = 1'b0;
            UnknownCommand = 1'b0;
        end
        else if (En == 1'b1) begin
            if (CommandToReadReady == 1'b1) begin
                case (Command)
                    8'h41  : begin   // A
                        ReadingData = 1'b0;
                        ReadingKey = 1'b1;
                        ChangeEncrypting = 1'b0;
                    end
                    8'h42  : begin   // B
                        ReadingKey = 1'b0;
                        ReadingData = 1'b1;
                        ChangeEncrypting = 1'b0;
                    end
                    8'h43  : begin   // C
                        Encrypting = 1'b1;
                        ChangeEncrypting = 1'b1;
                    end
                    8'h44  : begin   // D
                        Encrypting = 1'b0;
                        ChangeEncrypting = 1'b1;
                    end
                    default: begin
                        UnknownCommand = 1'b1;
                    end
                endcase
                Ready = 1'b1;
            end
            else begin
                Ready = 1'b0;
                ChangeEncrypting = 1'b0;
                UnknownCommand = 1'b0;
            end
        end
        else begin
            Ready = 1'b0;
            ChangeEncrypting = 1'b0;
            UnknownCommand = 1'b0;
        end
    end


endmodule
