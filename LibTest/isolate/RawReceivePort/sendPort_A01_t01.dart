/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final SendPort sendPort
 * Returns a SendPort that sends to this raw receive port.
 *
 * @description Checks that the getter returns functional SendPort
 *
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);
int expectedMessage = 10;

void receiveHandler(int message) {
  Expect.equals(expectedMessage, message);
  expectedMessage--;
  if (message == 0) {
    asyncEnd();
    receivePort.close();
  }
}

void iMain(var replyPort) {
  for (int k = expectedMessage; k >= 0; k--) {
    replyPort.send(k);
  }
}

main() {
  Object sendPort = receivePort.sendPort;
  Expect.isTrue(sendPort is SendPort);
  asyncStart();
  Isolate.spawn(iMain, sendPort);
}
