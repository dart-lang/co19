// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that `e!` removes only the top-level nullability of the
/// static type `X & T` of `e`. Test that it is a compile-time error to use a
/// nullable component of `X & NonNull(T)` as a non-nullable value.
/// @author sgrekhov22@gmail.com

void test1<X>(X x) {
  if (x is List<int?>?) {
    x![0].isEven;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test2<X>(X x) {
  if (x is int? Function()?) {
    x!().isEven;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

void test3<X>(X x) {
  if (x is (int?, {String? s})?) {
    if (2 > 1) {
      x!.$1.isEven;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    x!.s.length;
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
