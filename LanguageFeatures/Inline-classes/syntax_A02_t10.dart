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
/// @description Checks that it is a compile-time error if a `final inline`
/// class is implemented by another `final inline` class outside of the library
/// where it is defined
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "inline_class_lib.dart";

final inline class FIC implements FinalInlineClass {
//                                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final int id = 0;
  FIC();
}

main() {
  print(FIC);
}
