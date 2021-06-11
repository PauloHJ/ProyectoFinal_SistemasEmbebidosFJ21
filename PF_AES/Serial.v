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
    output Tx,
    input [127:0] Result,
    output reg [127:0] PT,
    output reg [127:0] Key,
    input Clk,
    input Rst,
    input WriteEn,
    input ReadEn,
    output reg WriteRy,
    output ReadRy,
    output KeyRy,
    output Encrypting
    );

    // states for state machine
    localparam
        waitingForReadEn = 3'h0,
        sendReadyToRead = 3'h1,
        waitingForCommand = 3'h2,
        reading16Bytes = 3'h3,
        setttingKey = 3'h4,
        settingData = 3'h5,
        waitingToWrite = 3'h6,
        writing16Bytes = 3'h7;

    // aux signals
    reg KeyRyAux;
    reg ReadRyAux;

    reg helperSendForOneCycle;

    // signlas for state management of state machine
    reg [3:0] pres_state;

    // embedded signals
    // ReadSerial
    wire [7:0] readSerialByteOutput;
    wire readSerialOutputReady;
    reg enableReadSerial;

    // WriteSerial
    wire [7:0] writeSerialInputByte;
    reg enableWriteSerial;
    wire writeSerialNewByte;
    wire writeSerialDone;

    // ReadCommand
    reg [7:0] readCommandByteInput;
    wire readingKey;
    wire readingData;
    wire encrypting;
    wire readCommandIsDone;
    wire changeInEncrypting;
    reg enableReadCommand;
    wire unknownCommand;

    // Read16Bytes
    wire [7:0] read16BytesInputByte;
    wire [127:0] read16BytesOutput;
    reg enableRead16Bytes;
    wire read16BytesOutputReady;
    
    // Write16Bytes
    wire [7:0] write16BytesSingleByteOutput;
    wire write16BytesSingleByteReady;
    wire write16BytesIsDone;
    wire write16BytesSingleByteDone;
    reg enableWrite16Bytes;

    // Mux
    reg selectByteForWriteSerial;
    reg manualByteReady;
    localparam writeManualByte = 8'h52;

    ReadSerial S01 (
	    .Rx(Rx),
        .outputByte(readSerialByteOutput),
        .Clk(Clk),
        .Rst(Rst),
        .outputReady(readSerialOutputReady),
        .ReadEn(enableReadSerial)
	);

    WriteSerial S02 (
        .Tx(Tx),
        .writeByte(writeSerialInputByte),
        .Clk(Clk),
        .Rst(Rst),
        .WriteEn(enableWriteSerial),
        .loadNewByte(writeSerialNewByte),
        .WriteByteReady(writeSerialDone)
    );

    ReadCommand S03 (
        .Command(readSerialByteOutput),  // input
        .CommandToReadReady(readSerialOutputReady),  // input
        .ReadingKey(readingKey),  // output
        .ReadingData(readingData),  // output
        .Encrypting(encrypting),   // output
        .UnknownCommand(unknownCommand),
        .Ready(readCommandIsDone),
        .ChangeEncrypting(changeInEncrypting),
        .En(enableReadCommand),
        .Clk(Clk),
        .Rst(Rst)
    );

    Read16Bytes S04 (
        .SingleByte(readSerialByteOutput), // input
        .ByteToReadReady(readSerialOutputReady), // input
        .bytesOutput(read16BytesOutput), // output
        .Enable(enableRead16Bytes), // input
        .bytesReady(read16BytesOutputReady), // output
        .Clk(Clk),
        .Rst(Rst)
    );

    Write16Bytes S05 (
        .Result(Result), // input
        .ByteToWrite(write16BytesSingleByteOutput), // output
        .ByteReadyToWrite(write16BytesSingleByteDone), // output
        .AllBytesDone(write16BytesIsDone),
        .ByteDone(writeSerialDone), // input
        .En(enableWrite16Bytes), // input
        .Clk(Clk), // input
        .Rst(Rst) // input
    );

    ChoseByte S06 (
        .Select(selectByteForWriteSerial),
        .OutputByte(writeSerialInputByte),
        .InputByte1(writeManualByte),
        .InputByte2(write16BytesSingleByteOutput),
        .OutputByteReady(writeSerialNewByte),
        .InputByteReady1(manualByteReady),
        .InputByteReady2(write16BytesSingleByteDone)
    );
    
    always @(negedge Clk) begin
        if (Rst) begin
            pres_state = waitingForReadEn;
        end
        else begin
            case (pres_state)
            waitingForReadEn : begin
                if (ReadEn == 1'b1)
                    pres_state = sendReadyToRead;
                else
                    pres_state = waitingForReadEn;
            end
            sendReadyToRead : begin
                if (writeSerialDone == 1'b1) // the byte was written
                    pres_state = waitingForCommand;
                else
                    pres_state = sendReadyToRead;
            end
            waitingForCommand : begin
                if (readCommandIsDone == 1'b1) begin // command is ready
                    if (changeInEncrypting == 1'b1 || unknownCommand == 1'b1) // there was a change of encrypting state so has to go back
                        pres_state = waitingForCommand;
                    else
                        pres_state = reading16Bytes;
                end
                else
                    pres_state = waitingForCommand;
            end
            reading16Bytes : begin
                if (read16BytesOutputReady == 1'b1) begin // 16 bytes are ready
                    if (readingKey == 1'b1 && readingData == 1'b0)  // reading key
                        pres_state = setttingKey;
                    else
                        pres_state = settingData;
                end
                else
                    pres_state = reading16Bytes;
            end
            setttingKey : begin
                if (KeyRyAux == 1'b1) // key is set
                    pres_state = waitingForCommand;
                else
                    pres_state = setttingKey;
            end
            settingData : begin
                if (ReadRyAux == 1'b1 && ReadEn == 1'b0)  // plain text is ready
                    pres_state = waitingToWrite;
                else
                    pres_state = settingData;
            end
            waitingToWrite : begin
                if (WriteEn == 1'b1)
                    pres_state = writing16Bytes;
                else
                    pres_state = waitingToWrite;
            end
            writing16Bytes : begin
                if (write16BytesIsDone == 1'b1) // writing is done
                    pres_state = waitingForReadEn;
                else
                    pres_state = writing16Bytes;
            end
            endcase
        end
    end

    // outputs of state machine and control
    always @(posedge Clk) begin
        if (Rst) begin
            KeyRyAux = 0;
            PT = 0;
            WriteRy = 1'b0;
            ReadRyAux = 1'b0;
            enableReadSerial = 1'b0;
            enableRead16Bytes = 1'b0;
            enableWriteSerial = 1'b0;
            enableWrite16Bytes = 1'b0;
            manualByteReady = 1'b0;
            enableReadCommand = 1'b0;
        end
        else begin
            case (pres_state) 
                waitingForReadEn : begin
                    // disable all modules
                    enableReadSerial = 1'b0;
                    enableRead16Bytes = 1'b0;
                    enableWriteSerial = 1'b0;
                    enableWrite16Bytes = 1'b0;
                    enableReadCommand = 1'b0;
                    // manage internal signals
                    // prepare to send 'Ready' to computer
                    manualByteReady = 1'b0;
                    selectByteForWriteSerial = 1'b0;

                    WriteRy = 1'b1; // we are done writing
                    ReadRyAux = 1'b0;

                    helperSendForOneCycle = 1'b0;
                end
                sendReadyToRead : begin
                    // manual byte is already R
                    // send for one clock cycle to load byte and enable writing
                    selectByteForWriteSerial = 1'b0;
                    enableWriteSerial = 1'b1;
                    if (helperSendForOneCycle == 1'b0) begin
                        helperSendForOneCycle = 1'b1;
                        manualByteReady = 1'b1;
                    end else begin
                        manualByteReady = 1'b0;
                    end
                    // enable Read Serial and Read Command to be ready for next state
                    // enable readCommand module
                    enableReadCommand = 1'b1;
                    // enable ReadSerial module
                    enableReadSerial = 1'b1;
                end
                waitingForCommand : begin
                    // enable Read Command and Read Serial
                    enableReadCommand = 1'b1;
                    enableReadSerial = 1'b1;
                    // disable writeSerial
                    enableWriteSerial = 1'b0;
                    // reset helper reg
                    helperSendForOneCycle = 1'b0;
                end
                reading16Bytes : begin
                    if (readingKey == 1'b1) begin
                        KeyRyAux = 1'b0;
                    end
                    // disable read command
                    enableReadCommand = 1'b0;
                    // enable ReadSerial and Read16bytes
                    enableReadSerial = 1'b1;
                    enableRead16Bytes = 1'b1;
                end
                setttingKey : begin
                    // disable Read Serial
                    enableReadSerial = 1'b0;
                    enableRead16Bytes = 1'b0;
                    // set the output of the new key
                    Key = read16BytesOutput; 
                    // set key is ready
                    KeyRyAux = 1'b1;
                end
                settingData : begin
                    // disable Read Serial
                    enableReadSerial = 1'b0;
                    enableRead16Bytes = 1'b0;
                    enableWrite16Bytes = 1'b0;
                    enableWriteSerial = 1'b0;
                    selectByteForWriteSerial = 1'b1;
                    // set the output of the new PT
                    PT = read16BytesOutput;
                    // set ReadRy
                    ReadRyAux = 1'b1;
                    WriteRy = 1'b0;
                end
                waitingToWrite : begin
                    ReadRyAux = 1'b0;
                    // set byte write to result
                    selectByteForWriteSerial = 1'b1;
                    WriteRy = 1'b0;
                end
                writing16Bytes : begin
                    // enable write serial and write16bytes
                    enableWriteSerial = 1'b1;
                    enableWrite16Bytes = 1'b1;
                    WriteRy = 1'b0;
                    ReadRyAux = 1'b0;
                end
            endcase
        end
    end


    assign KeyRy = KeyRyAux;
    assign ReadRy = ReadRyAux;
    assign Encrypting = encrypting;

endmodule
