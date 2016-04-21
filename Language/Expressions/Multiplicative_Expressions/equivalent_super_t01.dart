/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A multiplicative expression of the form super op e2
 * is equivalent to the method invocation super.op(e2).
 * @description Checks that an expression of the form super op e2
 * is equivalent to the method invocation super.op(e2).
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class S {
  var val;
  List<int> trace;

  S(this.val) : trace = new List<int>(4) {
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

class A extends S {
  A(var val) : super(val) {}

  test() {
    super * 1;
    super / 1;
    super % 1;
    super ~/ 1;
    for (var v in trace) {
       Expect.equals(1, v);
    }
  }
}

main() {
  A a = new A(24);
  a.test();
}
