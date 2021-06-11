const sleep = (ms) => {
  return new Promise((resolve) => setTimeout(resolve, ms));
};

const encryptFileInFPGA = async (
  protocolStatus,
  writeAndWait,
  key,
  encrypting,
  content
) => {
  // send key
  await sendKey(protocolStatus, writeAndWait, key);
  // set encrypting or decrypting
  setDirection(writeAndWait, encrypting);
  // process the content
  let response = await processContent(
    protocolStatus,
    writeAndWait,
    content,
    encrypting
  );
  return response;
};

const sendKey = async (protocolStatus, writeAndWait, key) => {
  while (true) {
    if (protocolStatus.fpgaState === "ready") {
      // only send key when fpga is ready
      writeAndWait("A"); // command to send key
      writeAndWait(key);
      return;
    }
    await sleep(500);
  }
};

const setDirection = (writeAndWait, encrypting) => {
  if (encrypting) {
    writeAndWait("C");
  } else {
    writeAndWait("D");
  }
};

const processContent = async (
  protocolStatus,
  writeAndWait,
  content,
  encrypting
) => {
  let binaryStr = Buffer.from(content, "binary");
  if (encrypting) {
    // get how much padding is needed
    let length = binaryStr.length + 1;
    let sizeOfPadding = 16 - (length % 16);
    sizeOfPadding = sizeOfPadding === 16 ? 0 : sizeOfPadding;
    let appendData = Buffer.from([]);
    for (let i = 0; i < sizeOfPadding; i++) {
      appendData = Buffer.concat([appendData, Buffer.from([0])]);
    }
    // append the size of the padding at the beginning of the data
    // append padding to back of data
    binaryStr = Buffer.concat([
      Buffer.from([sizeOfPadding]),
      binaryStr,
      appendData,
    ]);
    if (binaryStr.length % 16 !== 0) {
      return ["Error in padding", null];
    }
    let encryptedData = Buffer.from([]);
    for (let i = 0; i < binaryStr.length; i += 16) {
      await send16Bytes(
        protocolStatus,
        writeAndWait,
        binaryStr.slice(i, i + 16)
      );
      let res = await read16Bytes(protocolStatus);
      encryptedData = Buffer.concat([encryptedData, res]);
    }
    return [null, encryptedData];
  } else {
    if (binaryStr.length % 16 !== 0) {
      return ["Error in padding", null];
    }
    let decryptedData = Buffer.from([]);
    let amountPadding = 0;
    for (let i = 0; i < binaryStr.length; i += 16) {
      await send16Bytes(
        protocolStatus,
        writeAndWait,
        binaryStr.slice(i, i + 16)
      );
      let res = await read16Bytes(protocolStatus);
      // read how much padding
      if (i === 0) {
        amountPadding = res[0];
        decryptedData = Buffer.concat([decryptedData, res.slice(1)]);
      } else {
        decryptedData = Buffer.concat([decryptedData, res]);
      }
    }
    // remove padding
    decryptedData = decryptedData.slice(
      0,
      decryptedData.length - amountPadding
    );
    return [null, decryptedData];
  }
};

const send16Bytes = async (protocolStatus, writeAndWait, bytesOfContent) => {
  while (true) {
    if (protocolStatus.fpgaState === "ready") {
      // only send data when fpga is ready
      protocolStatus.state = "dataNotReady";
      writeAndWait("B"); // command to send text
      writeAndWait(bytesOfContent);
      return;
    }
    await sleep(100);
  }
};

const read16Bytes = async (protocolStatus) => {
  while (true) {
    if (protocolStatus.state === "dataReady") {
      let data = protocolStatus.data;
      protocolStatus.data = null;
      return data;
    }
    await sleep(500);
  }
};

module.exports = encryptFileInFPGA;
