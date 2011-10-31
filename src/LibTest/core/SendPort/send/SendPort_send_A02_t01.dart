/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the message contains any
 * receive ports, they are translated to the corresponding send port
 * before being transmitted.
 * @description Check that ReceivePort is converted to SendPort automatically.
 * @author msyabro
 * @needsreview Isn't it error in documentation? Shouldn't [replyTo] be 
 * translated to SendPort, not [message]?
 */

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  ReceivePort reply = new ReceivePort();
  
  /*rPort.receive(void func(var message, SendPort replyTo) {
    Expect.isTrue(message is SendPort);
    rPort.close();
  });
  
  sPort.send(new ReceivePort(), null);*/
  
  reply.receive(void func(var message, SendPort replyTo) {
    Expect.equals(message, "message");
    print(message);
    reply.close();
  });
  
  rPort.receive(void func(var message, SendPort replyTo) {
    replyTo.send(message, null);
    rPort.close();
  });
  
  sPort.send("message", reply);
}