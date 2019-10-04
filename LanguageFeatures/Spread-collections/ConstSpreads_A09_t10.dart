/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A spreadElement starting with [...] is a constant element if its expression
 * is constant and it evaluates to a constant List, Set or Map instance
 * originally created by a list, set or map literal. It is a potentially
 * constant element if the expression is a potentially constant expression.
 * @description: Checks that constant set spread element can be potentially
 * constant list or set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

Set emptyset = {};

class A {
  const A();
}

class B extends A {
  const B();
}

class MyClass {
  final String a;
  const MyClass(Object o) : a = o as String;
}


main() {
  const Set s1 = {...(A() is B ? [12345] : [])};
  Expect.setEquals(emptyset, s1);

  const Set s2 = {...(A() is A ? [12345] : [0])};
  Expect.setEquals({12345}, s2);

  const Set s3 = {...(MyClass("test") is MyClass ? [12345] : [])};
  Expect.setEquals({12345}, s3);

  const Set s4 = {...(A() is B ? [12345] : {12, 34})};
  Expect.setEquals({12, 34}, s4);

  const Set s5 = {...(A() is A ? [12345] : {0})};
  Expect.setEquals({12345}, s5);

  const Set s6 = {...(MyClass("test") is MyClass ? {12345} : {14})};
  Expect.setEquals({12345}, s6);
}
