// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that a check of the form `e is Null` or `e == null`
/// promotes `e` to `NonNull(T)` in the `false` continuation. Test type aliases.
/// @author iarkh@unipro.ru

import '../../Utils/static_type_helper.dart';

class A {
  foo() {}
}

typedef AAlias1 = A?;
typedef AAlias2 = AAlias1?;

dynamic init(x) => x;

main() {
  AAlias1 a1 = init(A());
  if (a1 is Null) {
  } else {
    a1.expectStaticType<Exactly<A>>();
    a1.foo();
    AAlias1 a11 = a1;
    a11.foo();
  }
  a1.expectStaticType<Exactly<A?>>();

  if (a1 == null) {
  } else {
    a1.expectStaticType<Exactly<A>>();
    a1.foo();
    AAlias1 a11 = a1;
  }

  AAlias2? a2 = init(A());
  if (a2 is Null) {
  } else {
    a2.expectStaticType<Exactly<A>>();
    a2.foo();
    AAlias1 a22 = a1;
  }
  a2.expectStaticType<Exactly<A?>>();

  if (a2 == null) {
  } else {
    a2.expectStaticType<Exactly<A>>();
    a2.foo();
    AAlias1 a22 = a1;
  }
}
