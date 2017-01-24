/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super.m
 * proceeds as follows:
 * Let g be the method currently executing, and let C be the class in which g
 * was looked up. Let Sdynamic be the superclass of C. Let f be the result of
 * looking up method m in Sdynamic with respect to the current library L. If
 * method lookup succeeds then i evaluates to the closurization of method f
 * with respect to superclass Sdynamic.
 * @description Check that if method lookup succeeds then result of the
 * property extraction is method that was found in a mixin.
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class M {
  int m() => 1;
}

class C extends A with M {
  int m() => 2;
  void test() {
    var f = super.m;
    Expect.equals(1, f());
  }
}

main() {
  C c = new C();
  c.test();
}
