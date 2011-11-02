/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When [Isolate]s are used as entry-points, the [port] field contains a
 * [ReceivePort].
 * @description Checks that the method returns non-null if the isolate is used as an entry-point.
 * @expected-output Ok
 * @author kaigorodov
 * @reviewer msyabro
 */

class TestIsolate extends Isolate {
  TestIsolate(): super() {}
  void main() {
    if (port!=null) {
      print("Ok");
    }
  }
}

void main() {
  new TestIsolate().spawn();
}
