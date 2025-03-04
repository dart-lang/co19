// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form [e == null] or of the form [e is Null] where
/// [e] has static type [T] promotes the type of [e] to [Null] in the [true]
/// continuation, and to [NonNull(T)] in the [false] continuation.
///
/// @description Check that [e] is promoted to [NonNull(T)] in the [false]
/// condition. Test [e == null] expression
/// @author iarkh@unipro.ru

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

dynamic init(dynamic x) => x;

main() {
  A? a = init(A());
  if (a == null) {
  } else {
    a.foo();
    A a1 = a;
  }

  B? b1 = init(B());
  if (b1 == null) {
  } else {
    b1.bar();
    B b11 = b1;
  }

  B<int>? b2 = init(B<int>());
  if (b2 == null) {
  } else {
    b2.bar;
    B b22 = b2;
  }

  int? i = init(10);
  if (i == null) {
  } else {
    i.isOdd;
    int i1 = i + 10;
  }
}
