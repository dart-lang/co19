/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 *
 * @description  Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object. Test
 * that methods of Object are allowed for the type <T extends F?>, where F is a
 * function type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

typedef void Foo();

void foo() {}
void bar() {}

class C<T extends Foo?> {
  T a;
  C(this.a);

  test() {
    Expect.isNotNull(a.hashCode);
    Expect.isNotNull(a.toString());
    Expect.isNotNull(a.runtimeType);
    Expect.isFalse(a == bar);
  }
}

main() {
  C<Foo?> c = new C<Foo?>(foo);
  c.test();
}
