/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When isolates are created, an instance of the template's class is
 * instantiated in the new isolate. After the [port] has been set up,
 * this [main] method is invoked on the instance.
 * @description Checks that this method is actually invoked
 * @expected-output main()
 * @author kaigorodov
 * @reviewer msyabro
 */

#import('dart:isolate');

class TestIsolate extends Isolate {
  TestIsolate(): super() {}
  void main() {
    print("main()");
  }
}

void main() {
  new TestIsolate().spawn();
}
