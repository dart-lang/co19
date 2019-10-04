/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant map spread [...?] element can only be
 * potentially constant map or [null].
 * @author iarkh@unipro.ru
 */

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
  const Map l1 = {...?(A() is B ? {1: 12345} : <Object, Object>{})};
  const Map l2 = {...?(A() is A ? {12345: 4} : {0: 1})};
  const Map l3 = {...?(MyClass("test") is MyClass ? {"a": "b"} : <int, int>{})};
  const Map m4 = {...?(A() is B ? {6: 7} : null)};
}
