/*
 * Copyright (c) 2011-2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sends messages to its ReceivePorts.
 *    SendPorts are created from ReceivePorts. Any message sent through
 * a SendPort is delivered to its corresponding ReceivePort. There might
 * be many SendPorts for the same ReceivePort.
 *    SendPorts can be transmitted to other isolates, and they preserve
 * equality when sent.
 *
 * @description Checks hashCode and equality operator of SendPort, that is sent
 * from another isolate.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "../../core/Object/allTests.lib.dart" as object;

void entryPoint(SendPort sendPort) {
  List<ReceivePort> ports = [];
  ReceivePort receivePort = new ReceivePort();
  ports.add(receivePort);
  // first tree are equal
  sendPort.send(receivePort.sendPort);
  sendPort.send(receivePort.sendPort);
  sendPort.send(receivePort.sendPort);
  // next three are not equal
  for (int i=0; i<3; i++) {
    ReceivePort receivePort = new ReceivePort();
    ports.add(receivePort);
    sendPort.send(receivePort.sendPort);
  }
  // last is a control port, used to stop the isolate and close all ports
  ReceivePort controlPort = new ReceivePort();
  controlPort.listen((_) {
    ports.forEach((port) => port.close());
  });
  ports.add(controlPort);
  sendPort.send(controlPort.sendPort);
}

Future test() async {
  ReceivePort receivePort = new ReceivePort();
  Isolate isolate = await Isolate.spawn(entryPoint, receivePort.sendPort);
  List sendPorts = await receivePort.take(7).toList();

  Object create() => sendPorts[0];

  List<Object> createEqual(int number) {
    Expect.isTrue(number<4);
    return sendPorts.sublist(0, number);
  }

  List<Object> createNotEqual(int number) {
    Expect.isTrue(number<4);
    return sendPorts.sublist(3, 3+number);
  }
  // execute tests
  object.test(create, createEqual, createNotEqual);
  // clean up
  sendPorts.last.send("finish");
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
