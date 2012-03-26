/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description More complex test with two different isolates.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

class AddIsolate extends Isolate {
  AddIsolate() {}
  
  void main() {
    port.receive(void func(var message, SendPort replyTo) {
      if(message[0] == 1) {
        new MultiplyIsolate().spawn().then(void func(SendPort port) {
          port.send([2, message[1] + message[2], 2], replyTo);
        });
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
      new AddIsolate().spawn().then(void func(SendPort port) {
        port.send([3, message[1] * message[2], 2], replyTo);
      });
    });
  }
}

void main() {
  new AddIsolate().spawn().then(void func(SendPort port) {
    port.call([1, 2, 2]).receive(void func(var message, SendPort replyTo) {
      Expect.equals(message, 10);
      print("Ok");
    });
  });
}
