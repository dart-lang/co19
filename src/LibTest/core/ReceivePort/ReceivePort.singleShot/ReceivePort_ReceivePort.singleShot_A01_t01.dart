/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Opens a single-shot reply port. Once a message has been received
 * on this port, it is automatically closed -- obviously without
 * throwing the message away before it can be processed.
 * @description Checks that single shot receive port is closed
 * after receiving the message.
 * @expected-output message1
 * @author msyabro
 * @reviewer kaigorodov
 */

void main() {
  ReceivePort rPort  = new ReceivePort.singleShot();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    print(message);
    sPort.send("message2", null);
  });
  
  sPort.send("message1", null);
  
}