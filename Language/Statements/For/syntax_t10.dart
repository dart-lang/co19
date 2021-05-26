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
///   initializedVariableDeclaration |
///   expression? ';'
/// ;
/// @description Checks that it is a compile-time error if the expression is
/// missing in a 'id in expression' of for-in statement.
/// @author iefremov
/// @reviewer rodionov


main() {
  try {
    for ( var x in  ) break;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (x) {}
}
