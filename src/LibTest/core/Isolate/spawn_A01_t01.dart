/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawns a new isolate, using this instance as template.
 * @description Checks that the new isolate is of the same class as the template.
 * @author kaigorodov
 * @reviewer msyabro
 * @expected-output Ok
 */

class TestIsolate extends Isolate {

  TestIsolate(): super();
  
  void main() {
     port.receive(void func(var message, SendPort replyTo) {
        replyTo.send(this is TestIsolate);
        port.close();
    });
  }
}

void main() {
  void receiveHandler (var res, SendPort replyTo) {
        Expect.isTrue(res);
        print("Ok");
  }
  new TestIsolate().spawn().then(void f(SendPort port) {
     port.call('check').receive(receiveHandler);
  });
}