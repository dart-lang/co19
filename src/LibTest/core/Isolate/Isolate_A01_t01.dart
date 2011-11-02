/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion New isolates are spawned by sub-classing [Isolate] and then invoking
 * [:spawn:] on the instance. This will spawn a new isolate, which creates a
 * new instance of the class, initializes the instance's [port] field
 * and invokes the instance method [main].
 * @description Checks that a new instance is created, the instance's [port] field
 * initialized and the instance method [main] invoked.
 * @author kaigorodov
 * @reviewer msyabro
 */

class TestIsolate extends Isolate {
  int i=111;
  
  TestIsolate(): super();
  
  void main() {
     port.receive( void func(var message, SendPort replyTo) {
        replyTo.send(i);
        port.close();
    });
  }
}

void main() {
  TestIsolate i = new TestIsolate();
  i.i=222;
  Expect.isTrue(i.i == 222);
  i.spawn().then((SendPort port) {
     port.call('get i').receive((var message, SendPort replyTo) {
        Expect.isTrue(message == 111);
        Expect.isTrue(i.i == 222);
     });
  });
  
}