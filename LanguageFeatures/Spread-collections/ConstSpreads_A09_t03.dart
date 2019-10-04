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
 * @description: Checks that constant list spread element can be potentially
 * constant list or set.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

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
  const List l1 = [...(A() is B ? [12345] : [])];
  Expect.listEquals([], l1);

  const List l2 = [...(A() is A ? [12345] : [0])];
  Expect.listEquals([12345], l2);

  const List l3 = [...(MyClass("test") is MyClass ? [12345] : [])];
  Expect.listEquals([12345], l3);

  const List l4 = [...(A() is B ? {12345} : {1})];
  Expect.listEquals([1], l4);

  const List l5 = [...(A() is A ? {12345} : {0})];
  Expect.listEquals([12345], l5);

  const List l6 = [...(MyClass("test") is MyClass ? {12345} : {1})];
  Expect.listEquals([12345], l6);
}
