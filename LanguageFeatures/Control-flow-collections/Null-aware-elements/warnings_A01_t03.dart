// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable. Test collection literals
/// @author sgrekhov22@gmail.com

main() {
  int? e = 2 > 1 ? 1 : null;

  <Iterable>{
    ?[],
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?[?e],
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e: 1},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{2: ?e},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <Iterable>[
    ?[],
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?[?e],
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e: 1},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{2: ?e},
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  <Iterable, int>{
    ?[]: 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?[?e]: 2,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e}: 3,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{}: 4,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{?e: 1}: 5,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?{2: ?e}: 6,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <int, Iterable>{
    1: ?[],
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    2: ?[?e],
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    3: ?{?e},
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    4: ?{},
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    5: ?{?e: 1},
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    6: ?{2: ?e},
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
