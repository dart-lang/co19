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
 * @description: Checks that constant map spread element can be potentially
 * constant map.
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
  const Map m1 = {...(A() is B ? {1: 12345} : <Object, Object>{})};
  Expect.mapEquals(<Object, Object>{}, m1);

  const Map m2 = {...(A() is A ? {12345: 4} : {0: 1})};
  Expect.mapEquals({12345: 4}, m2);

  const Map m3 = {...(MyClass("test") is MyClass ? {"a": "b"} : <int, int>{})};
  Expect.mapEquals({"a": "b"}, m3);
}
