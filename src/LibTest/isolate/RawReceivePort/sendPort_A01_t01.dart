/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionfinal SendPort sendPort
 * Returns a SendPort that sends to this raw receive port.
 * @description Checks that this getter returns functional SendPort
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);
var receivedMessage=null;

void receiveHandler(var message) {
  if (receivedMessage!=null) {
    Expect.equals(receivedMessage, message+1);
  }
  receivedMessage=message;
  if (message==0) {
    asyncEnd();
    receivePort.close();
  }
}

void iMain(SendPort replyPort) {
  for (int k=10; k>=0; k--) {
    replyPort.send(k);
  }
}

main() {
  var sendPort=receivePort.sendPort;
  Expect.isTrue(sendPort is SendPort);
  asyncStart();
  Isolate.spawn(iMain, sendPort);
}
