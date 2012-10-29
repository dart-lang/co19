/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form var v;
 * or the form var v = e; always induces an implicit setter function 
 * with signature
 *   set v = (x)
 * @description Checks that the signature of this implicit setter is correct
 * and the type of its formal parameter is indeed dynamic by passing values of
 * various types to it.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer rodionov
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
