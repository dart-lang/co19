/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionFuture<Isolate> spawn(void entryPoint(message), message)
 * Creates and spawns an isolate that shares the same code as the current isolate.
 * The entry-point function is invoked with the initial message.
 * @description Checks that an isolate can be spawned from a newly spawned isolate.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "../../../Utils/async_utils.dart";

var expectedMessage="message";

class Connection {
  var receivePort = new ReceivePort();
  SendPort replyPort;
  
  Connection([this.replyPort]);
  
  void receiveHandler(var message) {
    Expect.equals(expectedMessage, message);
    receivePort.close();
    if (replyPort!=null) {
      replyPort.send(message);
    }
    asyncEnd();
  }

  start(void entryPoint(message)) {
    asyncStart();
    Isolate.spawn(entryPoint, receivePort.sendPort);
    receivePort.listen(receiveHandler);
  }
}

void iMain2(SendPort replyPort) {
  replyPort.send(expectedMessage);
}

void iMain(SendPort replyPort) {
  new Connection(replyPort).start(iMain2);
}

main() {
  new Connection().start(iMain);
}
