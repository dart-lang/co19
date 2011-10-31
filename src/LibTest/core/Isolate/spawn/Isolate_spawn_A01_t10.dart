/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns new isolate
 * @description Checks spawning isolate from itself.
 * @author msyabro
 */

class TestIsolate extends Isolate {
  TestIsolate(): super.light() {}
  
  void main() {
    String name = "Alice";
    
    port.receive(void func(var message, SendPort replyTo) {
      print(name + " <- " + message);
      if(message == "Spawn") {
        ReceivePort rPort = new ReceivePort();
        
        Promise p = this.spawn();

        p.addCompleteHandler(void func(SendPort port) {
          rPort.receive(void func(var message, SendPort s) {
            if(message == "Ok") {
              replyTo.send("Spawned", port);
              rPort.close();
            } else {
              Expect.fail("It does not want to be Bob");
            }
          });
          
          port.send("Your name is Bob", rPort);
        });
      }  else if(message == "Who is it?") {
        replyTo.send(name, null);
      } else if(message.startsWith("Your name is")) {
        name = message.split(" ").last();
        replyTo.send("Ok", null);
      } else {
        Expect.fail("Incorrect message");
      }
    });
  }
}

void main() {
  TestIsolate i = new TestIsolate();
  Promise p = i.spawn();
  
  p.addCompleteHandler(void func(SendPort port) {
    ReceivePort portAlice = new ReceivePort();
    ReceivePort portBob = new ReceivePort();
    
    portAlice.receive( void func(var message, SendPort replyTo) {
      print("Main <- " + message);
      if(message == "Spawned") {
        replyTo.send("Who is it?", portBob);
        port.send("Who is it?", portAlice);
      } else if(message == "Alice") {
        portAlice.close();
      } else {
        Expect.fail("Wrong isolate");//not Alice
      }
    });
    
    portBob.receive( void func(var message, SendPort replyTo) {
      print("Main <- " + message);
      if(message == "Bob") {
        portBob.close();
      } else {
        Expect.fail("Wrong isolate"); //not Bob
      }
    });
  
    port.send("Spawn", portAlice);
  });
}