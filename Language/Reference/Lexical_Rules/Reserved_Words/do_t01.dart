// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion "do" is a reserved word.
/// A reserved word may not be used as an identifier;  it is a compile-time error
/// if a reserved word is used where an identifier is expected.
/// @description Checks that it is a compile-time error when a reserved word "do"
/// is used as a class name.
/// @author vasya
/// @reviewer rodionov


class do { } // error
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  try {
    null is do;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (anything) {
//^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
