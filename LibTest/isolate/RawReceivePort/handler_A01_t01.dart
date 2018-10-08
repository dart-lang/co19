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
 * @description Checks that the handler is invoked in the root-zone.
 *
 * @author kaigorodov
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";

RawReceivePort receivePort = new RawReceivePort(receiveHandler);

void receiveHandler(message) {
  Expect.identical(Zone.root, Zone.current);
  Expect.isNull(Zone.current.parent);
  receivePort.close();
  asyncEnd();
}

void iMain(SendPort replyPort) {
  replyPort.send(1);
}

main() {
  asyncStart();
  Isolate.spawn(iMain, receivePort.sendPort);
}
