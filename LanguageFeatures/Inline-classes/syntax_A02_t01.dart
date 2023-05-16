// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'final'? 'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
///
/// @description Checks that an inline class declaration may contain different
/// constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC {
  final int id;
  IC(this.id);
  IC.c1(int x, int y) : id = x + y;
  IC.c2(int x) : id = x;
  IC.c3() : id = 0;
}

main() {
  Expect.equals(42, IC(42).id);
  Expect.equals(3, IC.c1(1, 2).id);
  Expect.equals(4, IC.c2(4).id);
  Expect.equals(0, IC.c3().id);
}
