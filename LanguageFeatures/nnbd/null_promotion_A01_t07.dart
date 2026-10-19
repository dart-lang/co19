// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that a check of the form `e is Null` promotes `e` to
/// `NonNull(T)` in the `false` continuation.
/// @author iarkh@unipro.ru

import '../../Utils/static_type_helper.dart';

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

dynamic init(x) => x;

main() {
  A? a = init(A());
  if (a is Null) {
  } else {
    a.expectStaticType<Exactly<A>>();
    a.foo();
    A a1 = a;
  }

  B? b1 = init(B());
  if (b1 is Null) {
  } else {
    b1.expectStaticType<Exactly<B>>();
    b1.bar();
    B b11 = b1;
  }

  B<int>? b2 = init(B<int>());
  if (b2 is Null) {
  } else {
    b2.expectStaticType<Exactly<B<int>>>();
    b2.bar();
    B<int> b22 = b2;
  }

  int? i = init(0);
  if (i is Null) {
  } else {
    i.expectStaticType<Exactly<int>>();
    i.isOdd;
    int i1 = i + 2;
  }
}
