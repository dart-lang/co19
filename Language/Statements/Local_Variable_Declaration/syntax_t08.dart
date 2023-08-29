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
/// @description Checks that a newly introduced variable may shadow the one
/// declared in an enclosing scope but doesn't replace it.
/// @author rodionov

import '../../../Utils/expect.dart';

main() {
  String id = "foo";
  {
    int id = 1;
    Expect.equals(1, id);
  }
  Expect.equals("foo", id);
}
