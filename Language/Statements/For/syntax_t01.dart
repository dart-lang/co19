// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The for statement supports iteration.
/// forStatement:
///   await? for '(' forLoopParts ')' statement
/// ;
/// forLoopParts:
///   forInitializerStatement expression? ';' expressionList? |
///   declaredIdentifier in expression |
///   identifier in expression
/// ;
/// forInitializerStatement:
///   localVariableDeclaration |
///   expression? ';'
/// ;
/// @description Checks that it is a compile-time error if the loop parts are
/// missing entirely.
/// @author vasya


main() {
  for () {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}
