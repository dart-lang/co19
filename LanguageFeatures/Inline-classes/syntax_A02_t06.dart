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
/// @description Checks that it is a compile-time error if constant constructor
/// of an inline class is called with not a potentially constant expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

int z = 0;

 class IC {
  final int id;
  const IC([this.id = z]);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  const IC.c1(int x, {int y = 0}) : id = x + y + z;
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified
  const IC.c2(int x, [int y = 0]) : id = x + y + z;
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified
  const IC.c3([int x = 0]) : id = x + z;
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  const IC.c4({int x = 1}) : id = x + z;
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  IC(42);
  IC.c1(1);
  IC.c1(1, y: 2);
  IC.c2(4);
  IC.c2(4, 5);
  IC.c3(6);
  IC.c3().id;
  IC.c4(x: 7);
  IC.c4();
}
