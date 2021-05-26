// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A block statement supports sequencing of code.
/// Execution of a block statement { s1, ... , sn } proceeds as follows:
/// For i in 1..n; si is executed.
/// @description Checks that it is a compile-time error if a block statement
/// is missing the closing bracket.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


main() {
//     ^
// [cfe] unspecified
  {
    var foo = 0;
}
// [error line 24, column 0]
// [analyzer] unspecified