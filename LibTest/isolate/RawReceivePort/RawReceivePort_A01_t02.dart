/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory RawReceivePort([void handler(event)])
 * Opens a long-lived port for receiving messages.
 * @description Checks the function passesed as argument really works as a handler.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var expectedMessage="message";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);

void receiveHandler(var message) {
  Expect.equals(expectedMessage, message);
  receivePort.close();
  asyncEnd();
}

void iMain(SendPort replyPort) {
  replyPort.send(expectedMessage);
}

main() {
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
}
