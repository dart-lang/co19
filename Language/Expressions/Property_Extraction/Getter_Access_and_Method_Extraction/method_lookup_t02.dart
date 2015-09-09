/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows: ...
 * If method lookup succeeds then i evaluates to the closurization of method
 * f on object o
 * @description Check that f is never an abstract method
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 0;
}
class C extends A {
   int m();
}

main() {
  C c = new C();
  var f = c.m;
  Expect.equals(0, f());
}
