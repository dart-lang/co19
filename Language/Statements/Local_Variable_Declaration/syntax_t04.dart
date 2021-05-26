// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A variable declaration statement declares a new local variable.
///   localVariableDeclaration:
///     initializedVariableDeclaration ’;’
///   ;
/// @description Checks that a variable declaration statement T id = e; must end
/// with a semicolon.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


class T {}

main() {
  T id = new T()
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
