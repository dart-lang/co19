/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void set handler=(Function newHandler)
 * Sets the handler that is invoked for every incoming message.
 * The handler is invoked in the root-zone (Zone.root).
 *
 * @description Checks that different handlers can be used sequentially
 *
 * @author a.semenov@unipro.ru
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

void entryPoint(SendPort sendPort) {
  for (int i=0; i<100; i++) {
    sendPort.send(i);
  }
}

typedef void Handler(event);

main() {
  asyncStart();
  RawReceivePort receivePort;
  List receivedData1 = [];
  List receivedData2 = [];

  void check() {
    if (receivedData1.length==50 && receivedData2.length==50) {
      receivePort.close();
      Expect.listEquals(new List<int>.generate(50, (i)=>i*2), receivedData1);
      Expect.listEquals(new List<int>.generate(50, (i)=>i*2+1), receivedData2);
      asyncEnd();
    }
  }

  Handler handler1;
  Handler handler2 = (event) {
    receivedData2.add(event);
    receivePort.handler = handler1;
    check();
  };
  handler1 = (event) {
    receivedData1.add(event);
    receivePort.handler = handler2;
    check();
  };

  receivePort = new RawReceivePort(handler1);
  Isolate.spawn(entryPoint, receivePort.sendPort);
}
