/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converts this receive port to a send port.
 * @description Checks that SendPort is created.
 * @expected-output message1 received
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  int x = 1;
  
  rPort.receive(void func(var message, SendPort replyTo) {
    print(message+" received");
    rPort.close();
  });
  
  sPort.send("message1", null);
}