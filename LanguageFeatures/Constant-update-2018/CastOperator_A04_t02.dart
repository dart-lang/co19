/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form [e as T] is accepted as a potentially
 * and compile-time constant expression if [e] is potentially constant or
 * compile-time constant, respectively, and [T] is a compile-time constant type.
 * A compile-time constant type means any type that doesn't contain free type
 * variables, so the type expression always resolves to the exact same type.
 * @description Checks that an expression of the form [e as T] is not accepted
 * and causes compile time error if argument is a constant of incorrect type.
 * @author iarkh@unipro.ru
 */
class A {
  const A();
}

class B {
  const B();
}

class MyClass {
  final A a;
  const MyClass(Object o) : a = o as A;
}

main() {
  const MyClass c1 = MyClass("12345"); //# 01: compile-time error
  const MyClass c2 = MyClass(12345);   //# 02: compile-time error
  const MyClass c3 = MyClass(B());     //# 03: compile-time error
  const c4 = new List();               //# 04: compile-time error
}
