// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

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
/// @description Checks that it is a compile error when the iteration variable
/// identifier in a 'identifier in expression' loop variety is not declared
/// prior to the for statement.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


main() {
  for (l in []) {
//     ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }
}
