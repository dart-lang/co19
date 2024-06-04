// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A `nullAwareExpressionElement` or `nullAwareMapElement` is
/// constant if its inner expression or map entry is constant.
///
/// @description Check that it is a compile-time error if not a constant
/// `nullAwareExpressionElement` or `nullAwareMapElement` are used in a constant
/// collection.
/// @author sgrekhov22@gmail.com

main() {
  var e1 = 2 > 1 ? 1 : null;
  var e2 = 2 > 1 ? 2 : null;
  var Nil = null;

  const {
    ?e1,
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
    ?null,
    ?Nil
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  const [
    ?e1,
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
    ?null,
    ?Nil
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  const {
    ?e1: 1,
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
    1: ?e1,
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
    ?Nil: 0,
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified
    0: ?Nil
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
