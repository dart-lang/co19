// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The if statement allows for conditional execution of statements.
/// ifStatement:
///   if '(' expression ')' statement ( else statement)?
/// ;
/// @description Checks that a compile error is produced if the if statement
/// is missing.
/// @author vasya

main() {
  if (true)
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
//^
// [analyzer] unspecified
// [cfe] unspecified
