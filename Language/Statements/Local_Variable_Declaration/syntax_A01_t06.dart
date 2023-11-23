// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A variable declaration statement, also known as a local variable
/// declaration, has the following form:
/// ⟨localVariableDeclaration⟩ ::=
///     ⟨metadata⟩ ⟨initializedVariableDeclaration⟩ ‘;’
///
/// @description Checks that incorrect syntax of type parameters causes a
/// compile-time error.
/// @author kaigorodov

class T<K,V> {}

main() {
  T<int, String;>? id;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
