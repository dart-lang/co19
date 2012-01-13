/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The new instance is created by invoking the default constructor of the
 * class that served as template for spawning the new isolate.
 * @description Checks that the default constructor of the class invoked.
 * @author kaigorodov
 * @reviewer msyabro
 */

class TestIsolate extends Isolate {
  int i;
  
  TestIsolate(): super(), i=11;
  TestIsolate.light(): super(), i=22;
  TestIsolate.heavy(): super(), i=33;
  
  void main() {
     port.receive(void func(var message, SendPort replyTo) {
        replyTo.send(i);
        port.close();
    });
  }
}

void main() {
  TestIsolate i = new TestIsolate();
  i.spawn().then((SendPort port) {
     port.call('get i').receive((var i, SendPort replyTo) {
        Expect.isTrue(i == 11);
     });
  });
  
}