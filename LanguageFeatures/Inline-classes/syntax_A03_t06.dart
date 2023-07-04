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
/// ...
/// A compile-time error occurs if the inline class does not declare any
/// instance variables, and if it declares two or more instance variables. Let
/// id be the name of unique instance variable that it declares. The declaration
/// of id must have the modifier final, and it can not have the modifier late;
/// otherwise a compile-time error occurs.
///
/// @description Checks that it is not an error if an inline class implements
/// another inline class from another library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "inline_class_lib.dart";

inline class IC implements LibraryInlineClass2 {
  final int id;
  IC(this.id);
}

main() {
  var ic = IC(42);
  Expect.equals(42, ic.val);
}
