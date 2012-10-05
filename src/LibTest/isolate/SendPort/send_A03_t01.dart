/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If specified, the replyTo port will be provided to the receiver
 * to facilitate exchanging sequences of messages.
 * @description Checks that message is sent to [replyTo] port.
 * @author msyabro
 * @reviewer kaigorodov
 */

import "dart:isolate";

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  ReceivePort rReply = new ReceivePort();
  SendPort sReply = rReply.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    message ++;
    replyTo.send(message, sPort);
    if(message == 100) {
      rPort.close();
      rReply.close();
    }
  });
  
  rReply.receive(void func(var message, SendPort replyTo) {
    message++;
    replyTo.send(message, sReply);
  });
  
  sPort.send(1, sReply);
}