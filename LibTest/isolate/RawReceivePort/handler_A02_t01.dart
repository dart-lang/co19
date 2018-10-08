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
 * @description Checks that events are not received if handler is set to null.
 *
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";

Duration _500MS = new Duration(milliseconds:500);

void entryPoint(SendPort sendPort) {
  for (int i=0; i<10; i++) {
    sendPort.send(i);
  }
}

main() {
  asyncStart();
  RawReceivePort receivePort;
  List receivedData = [];

  void receiveHandler(event) {
    receivedData.add(event);
    if (receivedData.length == 5) {
      receivePort.handler = null;
      // wait 500 ms for unexpected data
      new Future.delayed(_500MS).then((_) {
        receivePort.close();
        Expect.listEquals(new List<int>.generate(5, (i) => i), receivedData);
        asyncEnd();
      });

    }
  }
  receivePort = new RawReceivePort(receiveHandler);
  Isolate.spawn(entryPoint, receivePort.sendPort);
}
