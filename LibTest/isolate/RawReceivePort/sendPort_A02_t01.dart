/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final SendPort sendPort
 * Returns a SendPort that sends to this raw receive port.
 *
 * @description Checks that same SendPort instance can be used by different
 * isolates.
 *
 * @author a.semenov@unipro.ru
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

const int ISOLATE_COUNT = 10;
const int SEND_COUNT = 10;
const int TOTAL_COUNT = ISOLATE_COUNT * SEND_COUNT;

void entryPoint(SendPort sendPort) {
  for (int i=0; i<SEND_COUNT; i++) {
    sendPort.send(i);
  }
}

main() {
  asyncStart();
  RawReceivePort receivePort;

  List receivedData = [];
  void receiveHandler(event) {
    receivedData.add(event);
    if (receivedData.length==TOTAL_COUNT) {
      receivePort.close();
      // check the data
      receivedData.sort();
      List<int> expectedData = new List<int>.generate(TOTAL_COUNT,
                                                      (i) => i ~/ ISOLATE_COUNT);
      Expect.listEquals(expectedData, receivedData);
      asyncEnd();
    }
  }
  receivePort = new RawReceivePort(receiveHandler);

  SendPort sendPort = receivePort.sendPort;
  for (int i=0; i<ISOLATE_COUNT; i++) {
    Isolate.spawn(entryPoint, sendPort);
  }
}
