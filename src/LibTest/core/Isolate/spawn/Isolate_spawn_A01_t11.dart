/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns new isolate
 * @description More complex test with two different isolates.
 * @author msyabro
 */

class AddIsolate extends Isolate {
  AddIsolate() {}
  
  void main() {
    port.receive(void func(var message, SendPort replyTo) {
      if(message[0] == 1) {
        MultiplyIsolate multIsolate = new MultiplyIsolate();
        Promise p = multIsolate.spawn();
      
        p.addCompleteHandler(void func(SendPort port) {
          ReceivePort rPort = new ReceivePort();
          rPort.receive(void func(var message, SendPort s) {
            replyTo.send(message, null);
            rPort.close();
          });
        
          port.send([2, message[1] + message[2], 2], rPort);
        });//addCompleteHandler
      } else if(message[0] == 3) {
        replyTo.send(message[1] + message[2], null);
      }
      
    }); //receive
  }
}

class MultiplyIsolate extends Isolate {
  MultiplyIsolate() {}
  
  void main() {
    port.receive(void func(var message, SendPort replyTo) {
      AddIsolate addIsolate = new AddIsolate();
      Promise p = addIsolate.spawn();
      
      p.addCompleteHandler(void func(SendPort port) {
        ReceivePort rPort = new ReceivePort();
        rPort.receive(void funv(var message, SendPort s) {
          replyTo.send(message, null);
          rPort.close();
        });
        
        port.send([3, message[1] * message[2], 2], rPort);
      });
    });
  }
}

void main() {
  AddIsolate addIsolate = new AddIsolate();
  Promise p = addIsolate.spawn();
  
  p.addCompleteHandler(void func(SendPort port) {
    ReceivePort rPort = new ReceivePort();
    
    rPort.receive(void func(var message, SendPort replyTo) {
      Expect.equals(message, 10);
      print("Ok");
      rPort.close();
    });
    
    port.send([1, 2, 2], rPort);
  });
}
