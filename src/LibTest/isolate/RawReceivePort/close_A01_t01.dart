/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * Closes the port.
 * After a call to this method any incoming message is silently dropped.
 * @description Checks that after closing, messages are dropped silently.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);

void receiveHandler(var message) {
  Expect.fail("Unexpected message: $message");
}

void iMain(SendPort replyPort) {
  replyPort.send("message");
}

main() {
  var sendPort=receivePort.sendPort;
  receivePort.close();
  Isolate.spawn(iMain, sendPort);
}
