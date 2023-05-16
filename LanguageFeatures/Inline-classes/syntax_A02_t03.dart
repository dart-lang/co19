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
/// @description Checks that an inline class declaration may contain redirecting
/// constructors
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC {
  final int id;
  IC(this.id);
  IC.c1(int x, {int y = 0}) : this(x + y);
  IC.c2(int x, [int y = 0]) : this(x + y);
  IC.c3([int x = 0]) : this(x);
  IC.c4({int x = 1}) : this(x);
}

main() {
  Expect.equals(42, IC(42).id);
  Expect.equals(1, IC.c1(1).id);
  Expect.equals(3, IC.c1(1, y: 2).id);
  Expect.equals(4, IC.c2(4).id);
  Expect.equals(9, IC.c2(4, 5).id);
  Expect.equals(6, IC.c3(6).id);
  Expect.equals(0, IC.c3().id);
  Expect.equals(7, IC.c4(x: 7).id);
  Expect.equals(1, IC.c4().id);
}
