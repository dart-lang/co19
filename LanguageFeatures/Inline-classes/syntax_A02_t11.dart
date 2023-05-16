// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if a `final inline` class is
/// implemented by another `final inline` class in the same library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

final inline class FIC {
  final int id ;
  const FIC(this.id);
}

final inline class FIC2 implements FIC {
  final int id;
  FIC2(this.id);
}

main() {
  Expect.equals(1, FIC(1).id);
  Expect.equals(2, FIC2(2).id);
}
