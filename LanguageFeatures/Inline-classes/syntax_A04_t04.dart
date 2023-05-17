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
/// ...
/// The name of the representation in an inline class declaration is the name id
/// of the unique final instance variable that it declares, and the type of the
/// representation is the declared type of id.
///
/// @description Checks runtime type and values of an inline class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  final num id;
  IC1(this.id);
}

inline class IC2 {
  final num _x = 3.14;
}

main() {
  IC1 ic1 = IC1(42);
  IC2 ic2 = IC2();
  Expect.equals(42, ic1.id);
  Expect.equals(3.14, ic2._x);
  Expect.isTrue(ic1 is num);
  Expect.isTrue(ic1 is int);
  Expect.isTrue(ic2 is num);
  Expect.isTrue(ic2 is double);
}
