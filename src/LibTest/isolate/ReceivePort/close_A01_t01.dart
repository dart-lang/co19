/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Closes this receive port immediately. Pending 
 * messages will not be processed and it is impossible to re-open the port.
 * @description Checks that messages are not processed when the port is closed.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  int x = 1;
  rPort.receive(void func(var message, SendPort replyTo) {
    x = message;
  });

  rPort.close();
  sPort.send(2);

  // make check in a callback, to be executed after the rPort.receive()
  ReceivePort rPort2 = new ReceivePort();
  rPort2.receive(void func(var message, SendPort replyTo) {
    rPort2.close();
    Expect.equals(1, x);
  });
  rPort2.toSendPort().send(0);
}