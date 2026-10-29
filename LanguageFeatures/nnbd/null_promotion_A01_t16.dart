// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that if the static type of `e` is `X & T`, then the type
/// `X & NonNull(T)` to which a check of the form `e == null` promotes `e` in
/// the `false` continuation is not a bottom type.
/// @author sgrekhov22@gmail.com

void test1<X>(X x) {
  if (x is int?) {
    // NonNull(X & int?) == X & int
    if (x == null) {
    } else {
      // Error if `x` is not a bottom type
      String s = x;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

void test2<X extends Object?>(X x) {
  if (x is num?) {
    // NonNull(X & num?) == X & num
    if (x == null) {
    } else {
      String s = x;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  print(test1);
  print(test2);
}
