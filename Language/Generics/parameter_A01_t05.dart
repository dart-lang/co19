/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *    typeParameter ::= metadata identifier (extends typeNotVoid)?
 *    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
 * A type parameter [T] may be suffixed with an [extends] clause that specifies
 * the upper bound for [T].
 * @description Statically checks that [extends] clause specifies upper bound
 * for the class type parameter
 * @author iarkh@unipro.ru
 */

class A {} 
class B extends A {}
class C extends B {}

void func1<T extends A>() {}
void func2<T extends B>() {}
void func3<T extends C>() {}

main() {
  func1();
  func1<A>();
  func1<B>();
  func1<C>();

  func2();
  func2<A>(); //# 01: compile-time error
  func2<B>();
  func2<C>();

  func3();
  func3<A>(); //# 02: compile-time error
  func3<B>(); //# 03: compile-time error
  func3<C>();
}
