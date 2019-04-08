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
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

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
  const Set l1 = {...(A() is B ? [12345] : [])};
  const Set l2 = {...(A() is A ? [12345] : [0])};
  const Set l3 = {...(MyClass("test") is MyClass ? [12345] : [])};
  const Set l4 = {...(MyClass(12345) is MyClass ? [12] : [])};       //# 01: compile-time error

  const Set l5 = {...(A() is B ? [12345] : {12, 34})};
  const Set l6 = {...(A() is A ? [12345] : {0})};
  const Set l7 = {...(MyClass("test") is MyClass ? {12345} : {14})};
  const Set l8 = {...(MyClass(12345) is MyClass ? {12} : <int>{})};  //# 02: compile-time error
}
