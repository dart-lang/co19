/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the message contains any receive ports,
 * they are translated to the corresponding send port before being transmitted.
 * @description Checks that ReceivePort as a message is converted to SendPort automatically.
 * @author kaigorodov
 * @reviewer msyabro
 */
 
void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(var message, SendPort replyTo) {
    print(message);
    Expect.isTrue(message is SendPort);
    rPort.close();
  });

  sPort.send(rPort, null);
}