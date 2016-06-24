/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void set handler=(Function newHandler)
 * Sets the handler that is invoked for every incoming message.
 * The handler is invoked in the root-zone (Zone.ROOT).
 *
 * @description Checks that the handler is invoked in the root-zone.
 *
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);

void receiveHandler(var message) {
  Expect.identical(Zone.ROOT, Zone.current);
  Expect.isNull(Zone.current.parent);
  receivePort.close();
  asyncEnd();
}

void iMain(SendPort replyPort) {
  replyPort.send(1);
}

main() {
  var sendPort = receivePort.sendPort;
  Expect.isTrue(sendPort is SendPort);
  asyncStart();
  Isolate.spawn(iMain, sendPort);
}
