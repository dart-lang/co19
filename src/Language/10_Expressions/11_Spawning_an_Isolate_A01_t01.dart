/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Spawning an isolate is accomplished via what is syntactically an
 * ordinary library call, invoking the instance method spawn() defined in class Isolate.
 * However, such calls  have the  semantic effect of creating a new isolate with
 * its own memory and thread of control.
 * @description Checks that a new isolate created with spawn method
 * has its own memory which is not shared with other isolates.
 * @author msyabro
 * @reviewer kaigorodov
 */

var topLevelVariable;

class TestIsolate extends Isolate {
  main() {
    port.receive(void func(var message, SendPort replyTo) {
      Expect.isNull(topLevelVariable);
      topLevelVariable = 10;
      replyTo.send("New value", null);
      port.close();
    });
  }
}

main() {
  receiveHandler(var message, SendPort replyTo) {
    Expect.equals("New value", message);
    Expect.equals(1, topLevelVariable);
  }

  new TestIsolate().spawn().then(void f(SendPort port) {
    topLevelVariable = 1;
    port.call('check').receive(receiveHandler);
  });
}

