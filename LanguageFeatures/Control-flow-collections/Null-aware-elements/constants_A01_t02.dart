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
  const e3 = 3;

  const {
    ?e1,
//  ^
// [analyzer] unspecified
    ?42
//  ^
// [analyzer] unspecified
  };

  const [
    ?e1,
//  ^
// [analyzer] unspecified
    ?42
//  ^
// [analyzer] unspecified
  ];

  const {
    ?e1: 1,
//  ^
// [analyzer] unspecified
    ?12: 2,
//  ^
// [analyzer] unspecified
    e2: ?1,
//      ^
// [analyzer] unspecified
    13: ?e1,
//     ^
// [analyzer] unspecified
    ?e3: ?e2,
//  ^
// [analyzer] unspecified
    ?14: ?2
//  ^
// [analyzer] unspecified
  };
}
