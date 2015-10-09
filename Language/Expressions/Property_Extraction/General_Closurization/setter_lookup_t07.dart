/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e#m proceeds as
 * follows:
 * First, the expression e is evaluated to an object o. Then:
 * if m is a setter name, let f be the result of looking up setter m in o with
 * respect to the current library L. If o is an instance of Type but e is not a
 * constant type literal, then if f is a method that forwards to a static
 * setter, setter lookup fails. If setter lookup succeeds then i evaluates to
 * the closurization of setter f on object o. If setter lookup failed,
 * a NoSuchMethodError is thrown.
 *
 * @description Check that if if there are variable named m in the class then
 * implicit setter lookup succeeds
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  int m;
}

main() {
  var o = new C();
  var x = o#m=;
  x(3);
  Expect.equals(3, o.m);
}
