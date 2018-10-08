/*
 * Copyright (c) 2011-2016, the Dart project authors.  Please see the AUTHORS
 * file for details. All rights reserved. Use of this source code is governed
 * by a BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory RawReceivePort([void handler(event)])
 * Opens a long-lived port for receiving messages.
 *
 * @description Checks that the argument can be omitted.
 *
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

String expectedMessage = "message";

RawReceivePort receivePort = new RawReceivePort();

void receiveHandler(message) {
  Expect.equals(expectedMessage, message);
  receivePort.close();
  asyncEnd();
}

void iMain(SendPort replyPort) {
  replyPort.send(expectedMessage);
}

main() {
  asyncStart();
  receivePort.handler = receiveHandler;
  Isolate.spawn(iMain, receivePort.sendPort);
}
