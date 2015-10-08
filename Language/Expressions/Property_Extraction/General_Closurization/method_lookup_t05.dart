/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e#m proceeds as
 * follows:
 * ...
 * If m is not a setter name, let f be the result of looking up method m
 * in o with respect to the current library L. If o is an instance of Type but
 * e is not a constant type literal, then if f is a method that forwards to a
 * static method, method lookup fails. If method lookup succeeds then i
 * evaluates to the closurization of method f on object o
 * @description Check that if method lookup succeeds, then the same method is
 * found as found by e.m expression
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  void m(int val) {}
  void n(int val) {}

  int m2() => 0;
  int n2() => 0;
}

main() {
  C o = new C();
  var i1 = o#m;
  var i2 = o.m;
  var i3 = o.n;
  Expect.isTrue(i1 == i2);
  Expect.isFalse(i1 == i3);

  var i4 = o#m2;
  var i5 = o.m2;
  var i6 = o.n2;
  Expect.isTrue(i4 == i5);
  Expect.isFalse(i4 == i6);
}
