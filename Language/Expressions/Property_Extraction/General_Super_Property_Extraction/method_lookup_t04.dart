/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * If m is not a setter name, let f be the result of looking up method m in
 * Sdynamic with respect to the current library L. If method lookup succeeds
 * then i evaluates to the closurization of method m with respect to superclass
 * Sdynamic.
 * @description Check that if method lookup succeeds then result of the
 * property extraction is method that was found during lookup. Method defined
 * in a mixin
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class M1 {
  String result = "none";

  void m() {
    this.result = "M1";
  }
}

class M2 {
  String result = "none";

  void m() {
    this.result = "M2";
  }
}

class B extends A with M1 {
  void m() {
    this.result = "C";
  }
}

class C extends B with M2 {
  void m() {
    this.result = "C";
  }

  void test() {
    var i = super#m;
    i();
    Expect.equals("M2", this.result);
  }
}

main() {
  C c = new C();
  c.test();
}
