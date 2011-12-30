/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sets up a callback function for receiving
 * pending or future messages on this receive port.
 * @description Checks that callback function is called when message is sent.
 * @author msyabro
 * @reviewer kaigorodov
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  int x = 1;
  
  sPort.send(2, sPort);

  rPort.receive(void func(var message, SendPort replyTo) {
    x *= message;
    if(x < 120) {
      replyTo.send(message + 1, replyTo);
    } else {
      Expect.equals(x, 120);
      rPort.close();
    }
  });
  
}