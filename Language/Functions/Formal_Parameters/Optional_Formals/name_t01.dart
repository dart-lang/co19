// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the name of a named optional
/// parameter begins with an `_` character.
///
/// @description Checks that it is a compile-time error if the name of a named
/// optional parameter begins with an `_` character.
/// @author rodionov

void f1({int _ = 0}) {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  void f2({var _x}) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  f1(_: 1);
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  f2();
}
