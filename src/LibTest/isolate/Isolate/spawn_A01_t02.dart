/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description Tries to spawn one isolate twice.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

class TestIsolate extends Isolate {
  TestIsolate(): super() {}
  
  void main() {
    port.receive( void func(var message, SendPort replyTo) {
      replyTo.send(message * 3, null);
    });
  }
}

void main() {
  void callbackA(var message) {
    Expect.equals(3, message);
  }
  void callbackB(var message) {
    Expect.equals(6, message);
  }
    
  new TestIsolate().spawn().then(void func(SendPort result) {
    result.call(1).then(callbackA);
  });
  new TestIsolate().spawn().then(void func(SendPort result) {
    result.call(2).then(callbackB);
  });

}