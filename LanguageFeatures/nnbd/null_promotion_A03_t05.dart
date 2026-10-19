// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that `e!` removes only the top-level nullability of the
/// static type of `e`. Test that it is a compile-time error to use a nullable
/// component of `NonNull(T)` as a non-nullable value.
/// @author sgrekhov22@gmail.com

dynamic init(dynamic x) => x;

main() {
  List<int?>? l = init(<int?>[1]);
  l![0].isOdd;
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int? Function()? f = init(() => 1);
  f!().isOdd;
//     ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int?, {String? s})? r = init((1, s: "s"));
  if (2 > 1) {
    r!.$1.isOdd;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  r!.s.length;
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
