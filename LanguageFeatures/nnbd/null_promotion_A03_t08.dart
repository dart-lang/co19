// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `e!` is
/// `X & NonNull(T)` if the static type of `e` is `X & T`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test1<X>(X x) {
  if (x is int?) {
    // NonNull(X & int?) == X & NonNull(int?) == X & int
    if (2 > 1) { // to avoid unnecessary promotion after the first `x!`
      x!.expectStaticType<Exactly<X>>(); // Check that `x!` is `X`
    }
    x!.isEven; // Check that `x!` is `int`
  }
}

void test2<X extends Object?>(X x) {
  if (x is num?) {
    // NonNull(X & num?) == X & NonNull(num?) == X & num
    if (2 > 1) {
      // ignore: unused_local_variable
      X y = x!;
    }
    if (2 > 1) {
      // ignore: unused_local_variable
      num n = x!;
    }
    x!.isNegative;
  }
}

void test3<X>(X x) {
  if (x is int) {
    // NonNull(X & int) == X & NonNull(int) == X & int
    if (2 > 1) {
      // ignore: unnecessary_non_null_assertion
      x!.expectStaticType<Exactly<X>>();
    }
    // ignore: unnecessary_non_null_assertion
    x!.isEven;
  }
}

void test4<X>(X x) {
  // ignore: type_check_with_null
  if (x is Null) {
    // NonNull(X & Null) == X & NonNull(Null) == X & Never
    if (1 > 2) {
      // `x!` is `X & Never`, so it is assignable to any type.
      if (2 > 1) {
        // ignore: unused_local_variable, null_check_always_fails
        int i = x!;
      }
      // ignore: unused_local_variable, null_check_always_fails
      String s = x!;
    }
  }
}

main() {
  test1<int>(1);
  test1<int?>(1);
  test1<Object?>(1);
  test2<int>(1);
  test2<num?>(1);
  test3<int>(1);
  test3<Object?>(1);
  test4<Null>(null);
  test4<Object?>(null);
}
