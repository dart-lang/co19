/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super.m
 * proceeds as follows:
 * Let S be the superclass of the immediately enclosing class. Let f be the
 * result of looking up method m in S with respect to the current library L. If
 * method lookup succeeds then i evaluates to the closurization of method f with
 * respect to superclass S
 * @description Check that if method lookup succeeds then result of the property
 * extraction is method that was found
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class C extends A {
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
