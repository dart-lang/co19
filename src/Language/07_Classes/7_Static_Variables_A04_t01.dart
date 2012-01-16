/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of the form static var v; or the
 * form static var v = e; always induces an implicit static setter function
 * with signature static set v(x) whose execution sets the value of v to the
 * incoming argument x.
 * @description Checks that the signature of this implicit setter is correct
 * and the type of its formal parameter is indeed Dynamic by passing values of
 * various types to it.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
 * @note issue 627 documents the failure of this tests in dartc mode
 */

class A {
  static var a;
  static var b = 1;
}

main() {
  A.a = 1;
  Expect.equals(1, A.a);
  A.a = "foo";
  Expect.equals("foo", A.a);
  List foo = new List<Map<String, int>>();
  A.a = foo;
  Expect.equals(foo, A.a);

  A.b = -1;
  Expect.equals(-1, A.b);
  A.b = "bar";
  Expect.equals("bar", A.b);
  Map bar = new Map<String, int>();
  A.b = bar;
  Expect.equals(bar, A.b);
}
