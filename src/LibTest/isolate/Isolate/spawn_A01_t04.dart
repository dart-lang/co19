/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description Checks spawning isolate from itself.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

class TestIsolate extends Isolate {
   String name = "Alice";

   TestIsolate(): super.light() {}
        
   void act(var message, SendPort replyTo) {
      void reply(var message, SendPort fromBob) {
        if (message == "Ok") {
           print(name + ".act.reply <- " + message);
           replyTo.send("Spawned", fromBob);
         } else {
           Expect.fail(name + ".reply <- " + message+": It does not want to be Bob");
         }
      }

      if (message == "Spawn") {
        print(name + ".act <- " + message);
        this.spawn().then(void func(SendPort portB) {
          portB.call("Your name is Bob").receive(reply);
        });
      } else if (message == "Who is it?") {
        print(name + ".act <- " + message);
        replyTo.send(name, null);
      } else if (message.startsWith("Your name is")) {
        name = message.split(" ").last();
        print(name + ".act <- " + message+"; new name="+name);
        replyTo.send("Ok", port.toSendPort());
      } else {
        Expect.fail(name + ".act <- "+message);
      }
    }    
  
  void main() {
    port.receive(act);
  }
}

void main() {
  new TestIsolate().spawn().then(void func(SendPort toAlice) {
    ReceivePort fromAlice = new ReceivePort();
    ReceivePort fromBob = new ReceivePort();
    
    toAlice.send("Spawn", fromAlice.toSendPort());

    fromAlice.receive( void func(var message, SendPort toBob) {
      if(message == "Spawned") {
        print("fromAlice <- " + message);
        toBob.send("Who is it?", fromBob.toSendPort());
        toAlice.send("Who is it?", fromAlice.toSendPort());
      } else if(message == "Alice") {
        print("fromAlice <- " + message);
        fromAlice.close();
      } else {
        Expect.fail("fromAlice<- " + message);
      }
    });

    fromBob.receive( void func(var message, SendPort unused){
      if(message == "Bob") {
        print("fromBob <- " + message);
        fromBob.close();
      } else {
        Expect.fail("fromBob <- " + message); //not Bob
      }
    });
  
  });
}