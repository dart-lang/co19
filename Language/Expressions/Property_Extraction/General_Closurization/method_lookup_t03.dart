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
 * @description Check that if method lookup succeeds then i evaluates to
 * the closurization of method f on object o
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  void m(int val) {}
}

main() {
  var o = new C();
  var i = o#m;
  Expect.isTrue(i is Function);
}
