// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A qualified reference to a static constant variable that is not qualified
///   by a deferred prefix.
/// @description Checks that a qualified reference with a deferred prefix to a
/// static constant variable cannot be used as a constant expression.
/// @author ngl@unipro.ru

import 'constants_lib.dart' deferred as clib;

const x = '';

const constList = const [
//                ^
// [cfe] unspecified
  x,
  clib.yy
//^
// [analyzer] unspecified
// [cfe] unspecified
];

main() {
  Expect.isTrue(constList is List);
}
