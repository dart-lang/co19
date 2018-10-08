/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Tests whether [other] is a SendPort 
 * pointing to the same ReceivePort as this one.
 *
 * @description Checks SendPort instance sent to another isolate and received
 * back is equal to itself, because it implements Capability
 *
 * @author a.semenov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:async";
import "dart:isolate";

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
  Isolate isolate = await Isolate.spawn(entryPoint,
                            [receivePort[0].sendPort, receivePort[1].sendPort]);
  SendPort sendPort = await receivePort[0].first;

  ReceivePort testPort = new ReceivePort();
  SendPort testSendPort0 = testPort.sendPort;
  sendPort.send(testSendPort0);
  SendPort testSendPort1 = await receivePort[1].first;

  Expect.isTrue(testSendPort0 == testSendPort1);

  receivePort.forEach((p) => p.close());
  testPort.close();
  asyncEnd();
}

void main() {
  asyncStart();
  test();
}
