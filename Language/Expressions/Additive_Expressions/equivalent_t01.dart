/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An additive expression of the form e1 op e2 is equivalent
 * to the method invocation e1.op(e2).
 * @description Checks that an additive expression of the form e1 op e2 is
 * equivalent to the method invocation e1.op(e2).
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

var logStr = "";

class A {
  final int value;

  const A(var v) : value = v;

  operator +(var v) {
    logStr = "${logStr}+";
    return new A(value+v);
  }
  operator -(var v) {
    logStr = "${logStr}-";
    return new A(v - value);
  }
}

main() {
  logStr = "";
  A a = new A(2);
  a + 3;
  a - 2;
  Expect.equals("+-", logStr);
}
