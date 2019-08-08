/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 *
 * @description Check that it is a compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable and not
 * dynamic
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class A {
  final String s = "Lily was here";
  void foo() {}
}

class C<X extends A?> {
  X x;
  C(this.x);

  test() {
    x.s;          //# 01: compile-time error
    x.foo;        //# 02: compile-time error
  }
}

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
  c.test();
}
