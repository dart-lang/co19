/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Closes this receive port immediately. Pending 
 * messages will not be processed and it is impossible to re-open the port.
 * @description Checks that messages is not processed when the port is closed.
 * @author msyabro
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  int x = 1;
  rPort.receive(void func(var message, SendPort replyTo) {
    x *= message;
    replyTo.send(x);
  });
  
  rPort.close();
  sPort.send(2, sPort);
  
  Expect.equals(1, x);
}