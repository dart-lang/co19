/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Closes the port.
 * After a call to this method any incoming message is silently dropped.
 *
 * @description Checks that after closing, messages are dropped silently.
 *
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */

import 'dart:async';
import "dart:isolate";
import "../../../Utils/expect.dart";

List receivedMessages = [];

RawReceivePort receivePort = new RawReceivePort(receiveHandler);

void receiveHandler(message) {
  receivedMessages.add(message);
}

void iMain(SendPort replyPort) {
  replyPort.send("message");
}

main() {
  asyncStart();
  SendPort sendPort = receivePort.sendPort;
  receivePort.close();
  Isolate.spawn(iMain, sendPort).then(
      // give some time for messages to be delivered
      (v) => new Future.delayed(new Duration(milliseconds: 500))
  ).then(
      (v) {
        Expect.listEquals([], receivedMessages,
          'Unexpected messages are received');
        asyncEnd();
      }
  );
}
