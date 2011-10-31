/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns new isolate
 * @description Tries to spawn one isolate twice.
 * @author msyabro
 */

class TestIsolate extends Isolate {
  TestIsolate(): super() {}
  
  void main() {
    port.receive( void func(var message, SendPort replyTo) {
      replyTo.send(message * 3, null);
    });
  }
}

void main() {
  TestIsolate i = new TestIsolate();
  Promise<SendPort> portA = i.spawn();//Spawn new Isolate
  Promise<SendPort> portB = i.spawn(); //Spawn Isolate one more time
  Expect.isFalse(portA == portB);
  
  ReceivePort rPortA = new ReceivePort(); //Create SendPort and ReceivePort
  SendPort sPortA = rPortA.toSendPort();   // for feedback from isolate
  rPortA.receive(void func(var message, SendPort replyTo) {
    Expect.equals(3, message);
    rPortA.close();
  });
  
  ReceivePort rPortB = new ReceivePort();
  SendPort sPortB = rPortB.toSendPort();
  rPortB.receive(void func(var message, SendPort replyTo) {
    Expect.equals(6, message);
    rPortB.close();
  });
  
  portA.addCompleteHandler(void func(SendPort result) {
    result.send(1, sPortA);//send message to isolate
  });
  portB.addCompleteHandler(void func(SendPort result) {
    result.send(2, sPortB);//send message to isolate
  });
}