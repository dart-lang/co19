// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The if statement allows for conditional execution of statements.
/// ifStatement:
///   if '(' expression ')' statement ( else statement)?
/// ;
/// @description Checks that a compile error is produced if the else statement is
/// missing.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


main() {
  if (false) {} else
}
//^
// [analyzer] unspecified
// [cfe] unspecified
