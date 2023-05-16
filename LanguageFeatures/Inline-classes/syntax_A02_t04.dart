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
/// @description Checks that an inline class declaration may contain  factory
/// constructors
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC {
  final int id;
  IC(this.id);
  factory IC.f1(int x, {int y = 0}) => IC(x + y);
  factory IC.f2(int x, [int y = 0]) => IC(x + y);
  factory IC.f3([int x = 0]) => IC(x);
  factory IC.f4({int x = 1}) => IC(x);
  factory IC.f5(int id) = IC;
}

main() {
  Expect.equals(1, IC.f1(1).id);
  Expect.equals(3, IC.f1(1, y: 2).id);
  Expect.equals(4, IC.f2(4).id);
  Expect.equals(9, IC.f2(4, 5).id);
  Expect.equals(6, IC.f3(6).id);
  Expect.equals(0, IC.f3().id);
  Expect.equals(7, IC.f4(x: 7).id);
  Expect.equals(1, IC.f4().id);
  Expect.equals(42, IC.f5(42).id);
}
