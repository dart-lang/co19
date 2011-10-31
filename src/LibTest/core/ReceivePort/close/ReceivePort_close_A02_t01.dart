/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Multiple invocations of [close] are allowed but ignored.
 * @description Checks multiple invocation of [close].
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
  rPort.close();
  rPort.close();
  
  sPort.send(2, sPort);
  
  Expect.equals(1, x);
}