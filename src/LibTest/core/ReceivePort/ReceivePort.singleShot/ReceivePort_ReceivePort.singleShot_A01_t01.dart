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
 * @author msyabro
 * @needsreview How to check that the port is closed?
 * Apparently one can still send messages to the closed port.
 */

void main() {
  ReceivePort rPort  = new ReceivePort.singleShot();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    print(message);
    sPort.send("another message", null);
  });
  
  sPort.send("message", null);
  
}