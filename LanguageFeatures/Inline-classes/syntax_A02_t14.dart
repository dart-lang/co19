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
/// @description Checks that it is a compile-time error if an `inline` class has
/// an `extends` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final int id = 0;
  IC1();
}

inline class IC2 extends IC1 {
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  IC2(int id);
}

final inline class FIC1 {
  final int id = 0;
  FIC1();
}

final inline class FIC2 extends FIC1 {
//                      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  FIC2(int id);
}

main() {
  print(IC2);
  print(FIC2);
}
