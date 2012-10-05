/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sends a message to this send port and returns a Future of the reply.
 * @description Checks that the opened port is single-shot and replyTo is set to the
 * opened port.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  Future callReceive = sPort.call("message1");
  
  rPort.receive(void func(var message, SendPort replyTo) {
    replyTo.send("$message received", null);
  });
  
  callReceive.then(void func(var message) {
    print(message);
    rPort.close();
  });
  
}