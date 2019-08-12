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
 * @description Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "../../Utils/expect.dart";

class A {
}

typedef AAlias = A?;

class C<X extends AAlias> {
  X x;
  C(this.x);

  test() {
    Expect.isNotNull(x.hashCode);
    Expect.isNotNull(x.toString());
    Expect.isNotNull(x.runtimeType);
    Expect.isFalse(x == new A());
  }
}

main() {
  AAlias a = new A();
  C<AAlias> c = new C<AAlias>(a);
  c.test();
}
