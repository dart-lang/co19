/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract Future call(message)
 * Sends a message to this send port and returns a Future of the reply.
 * @description Checks that the opened port is single-shot and replyTo is set to the
 * opened port.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  asyncStart();
  Future callReceive = sPort.call("message1");
  
  rPort.receive((var message, SendPort replyTo) {
    replyTo.send("$message received", null);
  });
  
  callReceive.then((var message) {
    print(message);
    rPort.close();
    asyncEnd();
  });
  
}