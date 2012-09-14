/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration,  interface declaration or type alias G may be generic.
 * typeParameter: identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that a generic syntax is not confused
 * with relational expressions.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

class A <B, C, D, E> {
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
    bar(A < B, C, D, E > f() => null);
  }
}

main() {
  new A().test();
}
