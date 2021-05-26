// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The break statement consists of the reserved word break and an
/// optional label.
/// breakStatement:
///   break identifier? ';'
/// ;
/// @description Checks that it is a compile-time error if the break statement
/// does not end with a semicolon.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov



main() {
  try
//^
// [analyzer] unspecified
// [cfe] unspecified
    for ( ; ; ) {
      break
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  } catch (x) {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
//^
// [analyzer] unspecified
// [cfe] unspecified
