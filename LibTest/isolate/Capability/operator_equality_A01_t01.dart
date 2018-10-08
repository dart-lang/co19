/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unforgeable object that comes back as equal when passed through
 * other isolates.
 *    Sending a capability object to another isolate, and getting it back, will
 * produce an object that is equal to the original. There is no other way to
 * create objects equal to a capability object.
 *
 * @description Checks Capability instance sent to another isolate and received
 * back is equal to itself
 *
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";

void entryPoint(List<SendPort> sendPort) {
  ReceivePort receivePort = new ReceivePort();
  receivePort.listen((data) {
      sendPort[1].send(data);
      receivePort.close();
  });
  sendPort[0].send(receivePort.sendPort);
}

Future test() async {
  List<ReceivePort> receivePort = new List.generate(2, (_)=> new ReceivePort());
  Isolate.spawn(entryPoint,
                      [receivePort[0].sendPort, receivePort[1].sendPort]);
  SendPort sendPort = await receivePort[0].first;

  Capability testCapability0 = new Capability();
  sendPort.send(testCapability0);
  Capability testCapability1 = await receivePort[1].first;

  Expect.isTrue(testCapability0 == testCapability1);

  receivePort.forEach((p) => p.close());
  asyncEnd();
}

void main() {
  asyncStart();
  test();
}
