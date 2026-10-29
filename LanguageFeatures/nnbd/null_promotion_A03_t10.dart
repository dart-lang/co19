// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that if the static type of `e` is `X & T`, where
/// `NonNull(T)` is not `Never`, then the static type `X & NonNull(T)` of `e!`
/// is not a bottom type.
/// @author sgrekhov22@gmail.com

void test1<X>(X x) {
  if (x is int?) {
    // NonNull(X & int?) == X & int
    // Error if `x!` is not a bottom type
    String s = x!;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test2<X extends Object?>(X x) {
  if (x is num?) {
    // NonNull(X & num?) == X & num
    String s = x!;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test3<X>(X x) {
  if (x is int) {
    // NonNull(X & int) == X & int
    String s = x!;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
