// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `e!` is
/// `NonNull(T)` if the static type of `e` is a type variable or a nullable type
/// variable.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test1<X extends Object>(X? x) {
  // NonNull(X?) = X
  x!.expectStaticType<Exactly<X>>();
}

void test2<X extends num>(X? x) {
  // NonNull(X?) = X
  if (2 > 1) {
    x!.expectStaticType<Exactly<X>>();
  }
  x!.isNegative;
}

void test3<X>(X x) {
  // NonNull(X) = X & Object
  if (2 > 1) {
    X x1 = x!;
  }
  if (2 > 1) {
    Object o = x!;
  }
  x!.hashCode;
}

void test4<X>(X? x) {
  // NonNull(X?) = NonNull(X) = X & Object
  if (2 > 1) {
    X x1 = x!;
  }
  Object o = x!;
}

void test5<X extends num?>(X x) {
  // NonNull(X) = X & num
  if (2 > 1) {
    X x1 = x!;
  }
  if (2 > 1) {
    num n = x!;
  }
  x!.isNegative;
}

void test6<X extends num?>(X? x) {
  // NonNull(X?) = NonNull(X) = X & num
  if (2 > 1) {
    X x1 = x!;
  }
  if (2 > 1) {
    num n = x!;
  }
  x!.isNegative;
}

main() {
  test1<String>("");
  test2<int>(1);
  test3<int>(1);
  test3<int?>(1);
  test4<int>(1);
  test4<int?>(1);
  test5<int>(1);
  test5<int?>(1);
  test6<int>(1);
  test6<int?>(1);
}
