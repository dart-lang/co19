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
 * @description Check that if static method lookup succeeds, then the same
 * method is found as found by e.m expression
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  static int m(int val) => 1;
  static int n(int val) => 2;

  static void m2() {}
  static void n2() {}
}

main() {
  var i1 = C#m;
  var i2 = C.m;
  var i3 = C.n;
  Expect.isTrue(i1 == i2);
  Expect.isFalse(i1 == i3);

  var i4 = C#m2;
  var i5 = C.m2;
  var i6 = C.n2;
  Expect.isTrue(i4 == i5);
  Expect.isFalse(i4 == i6);
}
