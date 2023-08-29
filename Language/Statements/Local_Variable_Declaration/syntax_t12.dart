// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A variable declaration statement, also known as a local variable
/// declaration, has the following form:
/// ⟨localVariableDeclaration⟩ ::= ⟨metadata⟩⟨initializedVariableDeclaration⟩‘;’
///
/// @description Checks that the type T in a variable declaration can be
/// parameterized.
/// @author kaigorodov

class T<K,V> {}

main() {
  T<int, String> id;
}
