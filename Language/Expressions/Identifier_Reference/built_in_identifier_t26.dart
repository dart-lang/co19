// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a built-in identifier is used as
/// the declared name of a prefix, class, type parameter or type alias.
/// @description Checks that it is a compile-time error if a built-in identifier
/// "static" is used as the declared name of a class.
/// @author rodionov
/// @reviewer iefremov


class static {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    null is static;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (anything) {
  }
}
