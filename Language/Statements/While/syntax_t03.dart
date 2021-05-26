// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The while statement supports conditional iteration, where the
/// condition is evaluated prior to the loop.
/// whileStatement:
///   while '(' expression ')' statement
/// ;
/// @description Checks that it is a compile-time error if the semicolon at the
/// end of the statement is missing.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


main() {
  try {
    while (true) break
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (x) {}
}

