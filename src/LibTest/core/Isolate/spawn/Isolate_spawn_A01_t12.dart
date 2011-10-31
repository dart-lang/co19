/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns new isolate
 * @description Spawns many isolates.
 * @author msyabro
 */

class AddIsolate extends Isolate {
  AddIsolate(): super();		
  
  void main() {
    SendPort replPort;
    ReceivePort rPort = new ReceivePort();
    
    rPort.receive(void f(var message, SendPort replyTo) {
      replPort.send(message, null);
      rPort.close();
    });
    port.receive(void func(var message, SendPort replyTo) {
      if(message < 85) {
        replPort = replyTo;
      
        Promise p = this.spawn();
      
        p.addCompleteHandler(void f(SendPort port) {
          port.send(++message, rPort);
        });
      } else {
        if(replPort == null) {
          replPort = replyTo;
        }
        replyTo.send(message, null);
        rPort.close();
      }
    }); //receive
  }
}

void main() {
  AddIsolate addIsolate = new AddIsolate();
  Promise p = addIsolate.spawn();
  
  p.addCompleteHandler(void func(SendPort port) {
    ReceivePort rPort = new ReceivePort();
    
    rPort.receive(void func(var message, SendPort replyTo) {
      if(message == 85) {
        print("Ok");
        rPort.close();
        
      }
    });
    
    port.send(1, rPort);
  });
}
