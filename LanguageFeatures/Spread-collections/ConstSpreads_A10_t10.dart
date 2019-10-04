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
 * @description: Checks that constant set spread [...?] element can be
 * potentially constant list or set.
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
  const Set l1 = {...?(A() is B ? [12345] : [])};
  const Set l2 = {...?(A() is A ? [12345] : [0])};
  const Set l3 = {...?(MyClass("test") is MyClass ? [12345] : [])};
  const Set l4 = {...?(A() is B ? [12345] : {12, 34})};
  const Set l5 = {...?(A() is A ? [12345] : {0})};
  const Set l6 = {...?(MyClass("test") is MyClass ? {12345} : {14})};
  const Set s7 = {...?(A() is B ? [12345] : null)};
}
