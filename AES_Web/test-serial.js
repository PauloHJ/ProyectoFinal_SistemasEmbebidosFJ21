const SerialPort = require("serialport");

const READY = Buffer.from("R")[0];

let serialPortOptions = {
  baudRate: 9600,
  port: "COM5",
  parity: "none",
  dataBits: 8,
};

{
  let argv = process.argv.slice(2);
  let currentFlag = "none";

  for (const arg of argv) {
    if (currentFlag === "none") {
      switch (arg) {
        case "--br":
          currentFlag = "baudrate";
          break;
        case "--port":
          currentFlag = "port";
          break;
        case "--bits":
          currentFlag = "databits";
          break;
        case "--parity":
          currentFlag = "parity";
          break;
      }
    } else {
      switch (currentFlag) {
        case "baudrate":
          serialPortOptions.baudRate = parseInt(arg);
          break;
        case "port":
          serialPortOptions.port = arg;
          break;
        case "databits":
          serialPortOptions.dataBits = parseInt(arg);
          break;
        case "parity":
          serialPortOptions.parity = arg;
          break;
      }
      currentFlag = "none";
    }
  }
}

const port = new SerialPort(serialPortOptions.port, {
  baudRate: serialPortOptions.baudRate,
  dataBits: serialPortOptions.dataBits,
  parity: serialPortOptions.parity,
});

let protocolStatus = {
  state: "waitingForReady",
  data: null,
};

let first = true;

port.on("data", (data) => {
  if (protocolStatus.state === "waitingForReady") {
    if (data[0] === READY) {
      protocolStatus.data = null;
      protocolStatus.state = first ? "sendInit" : "sendData";
      first = false;
    }
  } else {
    if (protocolStatus.data === null) {
      protocolStatus.data = data;
    } else {
      protocolStatus.data = Buffer.concat([protocolStatus.data, data]);
    }
    console.log(protocolStatus.data.toString("ascii"));
    if (protocolStatus.data.length === 16) {
      protocolStatus.state = "waitingForReady";
      console.log("Data:", protocolStatus.data.toString());
      protocolStatus.data = null;
    }
  }
});

const writeAndWait = (toSend) => {
  port.write(Buffer.from(toSend, "ascii"));
  port.drain();
};

let prev = 0;
let current;

const run = () => {
  if (protocolStatus.state === "waitingForReady") {
    current = 1;
    if (prev !== current) {
      console.log("Waiting for Ready");
    }
  } else if (protocolStatus.state === "sendInit") {
    current = 2;
    // fpga is ready
    // set a key
    writeAndWait("A");
    writeAndWait("0123456789ABCDEF");
    // set encrypting
    writeAndWait("C");
    // write data
    writeAndWait("B");
    writeAndWait("0123456789ABCDEF");
    protocolStatus.state = "waitingForData";
    if (prev !== current) {
      console.log("Init sent");
    }
  } else if (protocolStatus.state === "sendData") {
    current = 4;
    writeAndWait("B");
    writeAndWait("0123456789ABCDEF");
    protocolStatus.state = "waitingForData";
    if (prev !== current) {
      console.log("Data sent");
    }
  } else if (protocolStatus.state === "waitingForData") {
    current = 3;
    if (prev !== current) {
      console.log("Waiting for data");
    }
  }
  prev = current;
  setTimeout(run, 100);
};

run();
