/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If specified, the replyTo port will be provided to the receiver
 * to facilitate exchanging sequences of messages.
 * @description The replyTo port is the same as this SendPort.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    message ++;
    replyTo.send(message, replyTo);
    if(message == 100) {
      print("Done");
      rPort.close();
    }
  });
  
  sPort.send(1, sPort);
}