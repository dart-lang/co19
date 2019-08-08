/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if an optional parameter (named or otherwise) with
 * no default value has a potentially non-nullable type.
 *
 * @description Check that it is a compile-time error if an optional parameter
 * (named or otherwise) with no default value has a potentially non-nullable
 * type.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class A {
  static void test1(var x, [A a]) {}          //# 01: compile-time error

  static void test2(var x, {A a}) {}          //# 02: compile-time error
}

class C<X extends A?> {
  X x;
  C(this.x);

  void test1<X extends A?>(var x, [X x]) {}   //# 03: compile-time error

  void test2<X extends A?>(var x, {X x}) {}   //# 04: compile-time error
}

void test1<X extends A?>(var x, [X x]) {}     //# 05: compile-time error

void test2<X extends A?>(var x, {X x}) {}     //# 06: compile-time error

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
}
