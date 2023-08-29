// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A variable declaration statement, also known as a local variable
/// declaration, has the following form:
/// ⟨localVariableDeclaration⟩ ::=
///     ⟨metadata⟩ ⟨initializedVariableDeclaration⟩ ‘;’
///
/// @description Checks that a variable declaration statement `T id = e;` must
/// end with a semicolon.
/// @author vasya

class T {}

main() {
  T id = new T()
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
