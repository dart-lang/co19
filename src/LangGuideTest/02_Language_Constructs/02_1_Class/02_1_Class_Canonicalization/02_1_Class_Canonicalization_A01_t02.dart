/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Canonicalization occurs for all constant expressions. Two objects are
 * canonicalized, if they have the same class, and if all their fields are triple-equal
 * @description Checks canonicalization of objects of some custom type.
 * @author iefremov
 * @reviewer msyabro
 */


class A {
  final x;
  final y;
  const A.c1(foo, bar) : x = foo, y = bar;
  const A.c2(foo, bar) : x = bar, y = foo;
}

class B {
  final x;
  const B(this.x);
}

class C extends A {
  const C(foo, bar) : super.c1(foo, bar);
}

void main() {
  Expect.isTrue(const A.c1(1, 2) === const A.c1(1, 2));
  Expect.isTrue(const A.c1(1, 2) !== const A.c2(1, 2));
  Expect.isTrue(const A.c1(1, 2) === const A.c2(2, 1));

  Expect.isTrue(const B(const A.c1(1, 2)) === const B(const A.c2(2, 1)));

  Expect.isTrue(const A.c1(1, 2) !== const C(1, 2)); 
}
