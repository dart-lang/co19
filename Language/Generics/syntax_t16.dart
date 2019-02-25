/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, type alias, or function [G] may be generic,
 * that is, [G] may have formal type parameters declared.
 * @description Checks that a generic syntax is not confused with relational
 * expressions.
 * @author msyabro
 */
import "../../Utils/expect.dart";

class A<B, C, D, E> {
  foo(p1, p2, p3, p4) {
    Expect.equals(true, p1);
    Expect.equals(3, p2);
    Expect.equals(4, p3);
    Expect.equals(false, p4);
  }
  bar(p) {
    Expect.equals(null, p());
  }

  test() {
    var a = 1;
    var b = 2;
    var c = 3;
    var d = 4;
    var e = 5;
    var f = 6;
    foo(a < b, c, d, e > f);
  }
}

main() {
  new A().test();
}
