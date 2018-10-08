/*
 * Copyright (c) 2011-2017, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unforgeable object that comes back as equal when passed through
 * other isolates.
 *    Sending a capability object to another isolate, and getting it back, will
 * produce an object that is equal to the original. There is no other way to
 * create objects equal to a capability object.
 *
 * @description Checks hashCode and equality operator of Capability, that is
 * sent from another isolate.
 *
 * @author a.semenov@unipro.ru
 */
import "dart:isolate";
import "dart:async";
import "../../../Utils/expect.dart";
import "../../core/Object/allTests.lib.dart" as object;

void entryPoint(SendPort sendPort) {
  Capability capability0 = new Capability();
  // first tree are equal
  sendPort.send(capability0);
  sendPort.send(capability0);
  sendPort.send(capability0);
  // next three are not equal
  for (int i=0; i<3; i++) {
    sendPort.send(new Capability());
  }
  // last is a control port, used to stop the isolate and close all ports
  ReceivePort controlPort = new ReceivePort();
  controlPort.listen((_) {
    controlPort.close();
  });
  sendPort.send(controlPort.sendPort);
}

Future test() async {
  ReceivePort receivePort = new ReceivePort();
  Isolate.spawn(entryPoint, receivePort.sendPort);
  List capabilities = await receivePort.take(7).toList();

  Object create() => capabilities[0];

  List<Object> createEqual(int number) {
    Expect.isTrue(number<4);
    return capabilities.sublist(0, number);
  }

  List<Object> createNotEqual(int number) {
    Expect.isTrue(number<4);
    return capabilities.sublist(3, 3+number);
  }
  // execute tests
  object.test(create, createEqual, createNotEqual);
  // clean up
  capabilities.last.send("finish");
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
