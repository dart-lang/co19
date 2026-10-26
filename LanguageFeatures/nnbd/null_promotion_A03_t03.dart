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
  // NonNull(X?) == NonNull(X) == X & NonNull(Object) == X & Object
  // `X & Object <: X` and `X <: X & Object`, Let's check that `x!` is `X` and
  // `Object`
  if (2 > 1) { // to avoid unnecessary promotion after the first `x!`
    x!.expectStaticType<Exactly<X>>(); // Check that `x!` is `X`
  }
  Object o = x!; // Check that `x!` is `Object`
}

void test2<X extends num>(X? x) {
  // NonNull(X?) == NonNull(X) == X & NonNull(num) == X & num
  // `X & num <: X` and `X <: X & num`, Let's check that `x!` is `X` and `num`
  if (2 > 1) { // to avoid unnecessary promotion after the first `x!`
    x!.expectStaticType<Exactly<X>>(); // Check that `x!` is `X`
  }
  x!.isNegative; // Check that `x!` is `num`
}

void test3<X>(X x, X x2) {
  // NonNull(X) = X & Object
  if (2 > 1) {
    x!.expectStaticType<Exactly<X>>();
  }
  if (2 > 1) {
    Object o = x!; // x! is Object
  }
  var proofNotNever = x!;
  proofNotNever = x2; // Error if `proofNotNever` is `Never`
}

void test4<X>(X? x, X x2) {
  // NonNull(X?) = NonNull(X) = X & Object
  if (2 > 1) {
    x!.expectStaticType<Exactly<X>>();
  }
  if (2 > 1) {
    Object o = x!;
  }
  var proofNotNever = x!;
  proofNotNever = x2; // Error if `proofNotNever` is `Never`
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
