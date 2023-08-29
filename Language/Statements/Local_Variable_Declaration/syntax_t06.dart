// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A variable declaration statement, also known as a local variable
/// declaration, has the following form:
/// ⟨localVariableDeclaration⟩ ::= ⟨metadata⟩⟨initializedVariableDeclaration⟩‘;’
///
/// Each local variable declaration introduces a local variable into the current
/// scope.
///
/// @description Checks that the variable declared `int id;` in a block is not
/// available in another block that isn't included in the first one.
/// @author rodionov

main() {
  {
    int id;
  }
  {
    id = null;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
