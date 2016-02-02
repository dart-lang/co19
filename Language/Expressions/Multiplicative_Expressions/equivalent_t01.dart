/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A multiplicative expression of the form e1 op e2
 * is equivalent to the method invocation e1.op(e2).
 * @description Checks that an expression of the form e1 op e2
 * is equivalent to the method invocation e1.op(e2).
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class A {
  var val;

  List<int> trace;

  A(this.val) : trace = new List<int>(4) {
     for (var k = 0; k < 4; k++) {
        trace[k] = 0;
     }
  }

  operator *(var v) {
    trace[0] += 1;
    return val * v;
  }
  operator /(var v) {
    trace[1] += 1;
    return val / v;
  }
  operator %(var v) {
    trace[2] += 1;
    return val % v;
  }
  operator ~/(var v) {
    trace[3] += 1;
    return val ~/ v;
  }
}

main() {
  A a = new A(24);
  a * 1;
  a / 2;
  a % 2;
  a ~/ 2;
  for (var v in a.trace) {
     Expect.equals(1, v);
  }
}
