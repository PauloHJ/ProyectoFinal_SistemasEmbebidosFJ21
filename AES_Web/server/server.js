const express = require("express");
const app = express();
const port = 3030;
const bodyParser = require("body-parser");
const SerialPort = require("serialport");
const encryptFileInFPGA = require("./connectionWithFpga");

const READY = Buffer.from("R")[0];

// default options for the serial connection
let serialPortOptions = {
  baudRate: 9600,
  port: "COM5",
  parity: "none",
  dataBits: 8,
};

// read command flags to change serial options
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

// create connection with the fpga
const serialPort = new SerialPort(serialPortOptions.port, {
  baudRate: serialPortOptions.baudRate,
  dataBits: serialPortOptions.dataBits,
  parity: serialPortOptions.parity,
});

let protocolStatus = {
  fpgaState: "sendingReady",
  state: "waitingForReady",
  data: null,
};

serialPort.on("data", (data) => {
  if (protocolStatus.fpgaState === "sendingReady") {
    if (data[0] === READY) {
      protocolStatus.fpgaState = "ready";
    }
  } else {
    if (protocolStatus.data === null) {
      protocolStatus.data = data;
    } else {
      if (protocolStatus.data.length + data.length === 17) {
        protocolStatus.data = Buffer.concat([
          protocolStatus.data,
          data.slice(0, data.length - 1),
        ]);
        if (data[data.length - 1] === READY) {
          protocolStatus.fpgaState = "ready";
        }
        protocolStatus.state = "dataReady";
      } else if (protocolStatus.data.length + data.length === 16) {
        protocolStatus.data = Buffer.concat([protocolStatus.data, data]);
        protocolStatus.fpgaState = "sendingReady";
        protocolStatus.state = "dataReady";
      } else {
        protocolStatus.data = Buffer.concat([protocolStatus.data, data]);
      }
    }
  }
});

const writeAndWait = (toSend) => {
  serialPort.write(Buffer.from(toSend, "binary"));
  serialPort.drain();
};

app.use(bodyParser.json());

app.post("/api", async (req, res) => {
  if (!req.body.encrypt) {
    if (Buffer.from(req.body.content, "binary").length % 16 !== 0) {
      return res.status(400).send("File with wrong padding");
    }
  }
  let [error, result] = await encryptFileInFPGA(
    protocolStatus,
    writeAndWait,
    req.body.key,
    req.body.encrypt,
    req.body.content
  );
  if (error) {
    return res.status(400).send(error);
  }
  res.send(result);
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
