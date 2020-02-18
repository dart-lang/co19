/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a class declaration declares an instance
 * variable with a potentially non-nullable type and no initializer expression,
 * and the class has a generative constructor where the variable is not
 * initialized via an initializing formal or an initializer list entry, unless
 * the variable is marked with the late modifier.
 *
 * @description Check that it is no compile-time error if an instance variable
 * with a potentially non-nullable type has no initializer expression but
 * initialized in a constructor via an initializing formal or an initializer
 * list entry. Test Function types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
typedef void Foo();

class A {
  Function f1;
  Foo f2;
  A(Function f1, Foo f2): this.f1 = f1, this.f2 = f2 {}
}

class C {
  Function f1;
  Foo f2;
  C(this.f1, this.f2);
}

void foo() {}
int bar() => 42;

main() {
  new A(bar, foo);
  new C(bar, foo);
}
