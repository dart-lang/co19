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
/// @description Checks that there is no setter named `id=`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final num id;
  IC1(this.id);
}

main() {
  IC1 ic1 = IC1(3.14);
  ic1.id = 1.1;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
