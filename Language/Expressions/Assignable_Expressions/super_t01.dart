/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignable expression of the form super.id is evaluated as
 * a property extraction.
 * @description Checks that an assignable expression of the form super.id is
 * evaluated as a getter invocation.
 * @author msyabro
 */
import '../../../Utils/expect.dart';

class S {
  S(): _x = 1, y = 1;
  var _x;
  var y;
  get x {
    y = 20;
    return _x;
  }
}

class A extends S {
  test() {
    Expect.equals(1, super.x);
    Expect.equals(20, super.y);
  }
}

main() {
  A a = new A();
  a.test();
}
