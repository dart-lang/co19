/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiple invocations of [close] are allowed but ignored.
 * @description Checks multiple invocation of [close].
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  int x = 1;
  rPort.receive((var message, SendPort replyTo) {
    x *= message;
    replyTo.send(x);
    throw "Closed port cannot receive messages!";
  });
  
  rPort.close();
  rPort.close();
  rPort.close();
  
  sPort.send(2, sPort);
}