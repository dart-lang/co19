/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An additive expression of the form super op e2 is equivalent
 * to the method invocation super.op(e2).
 * @description Checks that an additive expression of the form super op e2 is
 * equivalent to the method invocation super.op(e2).
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

var logStr = "";

class S {
  final value;

  const S(var v) : value = v;

  operator +(var v) {
    logStr = "${logStr}+";
    return new A(value + v);
  }
  operator -(var v) {
    logStr = "${logStr}-";
    return new A(v - value);
  }
}

class A extends S {
  A(var v) : super(v) {}

  test() {
    logStr = "";
    super + 5;
    super - 4;
    Expect.equals("+-", logStr);
  }
}

main() {
  A a = new A(2);
  a.test();
}
