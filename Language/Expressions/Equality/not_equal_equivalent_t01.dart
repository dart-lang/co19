/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An equality expression of the form e1 != e2 is equivalent to the
 * expression !(e1 == e2).
 * @description Checks that expression of the form e1 != e2 is equivalent to the
 * expression !(e1 == e2).
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class A{
  operator ==(var val) {
    return identical(this, val);
  }
}

main() {
  A a = new A();
  A b = new A();
  Expect.equals(a != a, !(a == a));
  Expect.equals(a != b, !(a == b));
}
