// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable. Test literals
/// @author sgrekhov22@gmail.com

main() {
  <Object>{
    ?42,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?3.14,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?true,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?"",
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?'''  Raw string   '''
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <Object>[
    ?42,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?3.14,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?true,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?"",
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?'''  Raw string   '''
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  <Object, int>{
    ?42: 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?3.14: 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?true: 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?"": 0,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?'''  Raw string   ''': 0
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <int, Object>{
    1: ?42,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    2: ?3.14,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    3: ?true,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    4: ?"",
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    5: ?'''  Raw string   '''
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
