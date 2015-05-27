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
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

ReceivePort receivePort = new ReceivePort();

void receiveHandler(var message) {
  Expect.fail("Unexpected message: $message");
}

void iMain(SendPort replyPort) {
  replyPort.send("message");
}

main() {
  var sendPort=receivePort.sendPort;
  receivePort.listen(receiveHandler);
  receivePort.close();
  Isolate.spawn(iMain, sendPort);
}
