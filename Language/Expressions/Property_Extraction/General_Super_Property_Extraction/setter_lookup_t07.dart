/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * Let g be the method currently executing, and let C be the class in which g
 * was looked up. Let Sdynamic be the superclass of C.
 * If m is a setter name, let f be the result of looking up setter m in Sdynamic
 * with respect to the current library L. If setter lookup succeeds then i
 * evaluates to the closurization of setter f with respect to superclass
 * Sdynamic.
 * @description Check that if there are setter m in a mixin then setter lookup
 * succeeds
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class M {
  String result = "none";

  void set m(int val) {
    this.result = "M";
  }
}

class C extends A with M {
  void set m(int val) {
    this.result = "C";
  }

  void test() {
    var i = super#m=;
    i(1);
    Expect.equals("M", this.result);
  }
}

main() {
  C c = new C();
  c.test();
}
