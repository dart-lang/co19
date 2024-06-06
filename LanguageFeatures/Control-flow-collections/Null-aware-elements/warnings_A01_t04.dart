// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable.
/// @author sgrekhov22@gmail.com

int? f(int? v) => v;

main() {
  <int>[
    ? f(1) ?? 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ? 2 > 1 ? 2 : 3
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  <int>{
    ? f(1) ?? 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ? 2 > 1 ? 2 : 3
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <int, int>{
    ? f(1) ?? 1: 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ? 2 > 1 ? 2 : 3: 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    4: ? f(1) ?? 1: 0,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    5: ? 2 > 1 ? 2 : 3: 0,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
