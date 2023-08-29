// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A variable declaration statement, also known as a local variable
/// declaration, has the following form:
/// ⟨localVariableDeclaration⟩ ::=
///     ⟨metadata⟩ ⟨initializedVariableDeclaration⟩ ‘;’
///
/// @description Checks several assignments of variables declared as `T id;`
/// that are correct and do not produce errors or warnings.
/// @author vasya

class S {}
class T extends S {}
class C extends T {}

main() {
  T id;
  id = new C();

  id = new T();

  bool id1;
  id1 = false;

  String id2;
  id2 = "";
}
