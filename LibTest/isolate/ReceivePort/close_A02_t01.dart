/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void close()
 * If the stream has already been canceled this method has no effect.
 * @description Checks multiple invocation of [close].
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
  for (int k=0; k<10; k++) {
    receivePort.close();
  }
  Isolate.spawn(iMain, sendPort);
}