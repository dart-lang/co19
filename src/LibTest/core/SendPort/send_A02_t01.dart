/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the message contains any receive ports,
 * they are translated to the corresponding send port before being transmitted.
 * @description Checks that ReceivePort in a message is converted to SendPort automatically.
 * @author msyabro
 * @reviewer kaigorodov
 * @needsreview Issue 437
 */
 
 class Message {
   ReceivePort reply;
   
   Message(): super(), reply = new ReceivePort() {
   }
 }

void main() {
  ReceivePort rPort = new ReceivePort();
  SendPort sPort = rPort.toSendPort();
  
  rPort.receive(void func(Message message, SendPort replyTo) {
    print(message.reply);
    Expect.isTrue(message.reply is SendPort);
    rPort.close();
  });

  sPort.send(new Message(), null);
}