/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * Closes this.
 * If the stream has not been canceled yet, adds a close-event to the event queue
 * and discards any further incoming messages.
 * @description Checks that messages are not processed when the port is closed.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */

import 'dart:async';
import "dart:isolate";
import "../../../Utils/expect.dart";

List receivedMessages = [];

void receiveHandler(var message) {
  receivedMessages.add(message);
}

void iMain(SendPort replyPort) {
  replyPort.send("message1");
  replyPort.send("message2");
}

main() {
  asyncStart();
  ReceivePort closedPort = new ReceivePort();
  SendPort sendPort = closedPort.sendPort;
  closedPort.listen(receiveHandler);
  closedPort.close();

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
