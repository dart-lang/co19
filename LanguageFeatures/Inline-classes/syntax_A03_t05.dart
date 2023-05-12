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
/// A compile-time error occurs if the inline class does not declare any
/// instance variables, and if it declares two or more instance variables. Let
/// id be the name of unique instance variable that it declares. The declaration
/// of id must have the modifier final, and it can not have the modifier late;
/// otherwise a compile-time error occurs.
///
/// @description Checks that it is not an error if an inline class declares one
/// `final` instance variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class IC1 {
  final int id;
  IC1(this.id);
}

inline class IC2 {
  final int id;
  IC2.named(int x, int y) : id = x + y;
}

inline class IC3 {
  final int id = 0;
}

main() {
  Expect.equals(42, IC1(42).id);
  Expect.equals(42, IC2.named(11, 31).id);
  Expect.equals(0, IC3().id);
}
