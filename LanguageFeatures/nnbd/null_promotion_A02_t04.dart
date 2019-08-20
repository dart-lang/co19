/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e != null] or of the form [e is T] where [e]
 * has static type [T?] promotes the type of [e] to [T] in the [true]
 * continuation, and to [Null] in the [false] continuation.
 *
 * @description Check that type of [e] is promoted to [T] in the [true]
 * condition. Test [e is T] expression. Test type aliases
 * @author iarkh@unipro.ru
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

typedef AAlias = A?;
typedef BAlias1 = B?;
typedef BAlias2 = B<int>?;
typedef IntAlias = int?;

main() {
  AAlias a = new A();
  if (a is A) {
    a.foo();
  }

  BAlias1 b1 = new B();
  if (b1 is B) {
    b1.bar();
  }

  BAlias2 b2 = new B<int>();
  if (b2 is B<int>()) {
    b2.bar();
  }

  IntAlias i = 42;
  if (i is int) {
    i.isOdd;
  }
}
