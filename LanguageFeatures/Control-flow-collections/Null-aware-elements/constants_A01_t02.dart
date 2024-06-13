// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A `nullAwareExpressionElement` or `nullAwareMapElement` is
/// constant if its inner expression or map entry is constant.
///
/// @description Check that it is a warning if a `nullAwareExpressionElement` or
/// `nullAwareMapElement` is a non-nullable constant
/// @author sgrekhov22@gmail.com

main() {
  const e1 = 1;
  const e2 = 2;

  const {
    ?e1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?42
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  const [
    ?e1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?42
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  const {
    ?e1: 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?1: 2,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    e1: ?1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    1: ?e1,
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    ?e1: ?e2,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    ?1: ?2
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
