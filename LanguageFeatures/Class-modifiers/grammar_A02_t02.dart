// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is:
///
/// classDeclaration  ::= (classModifiers | mixinClassModifiers) 'class' typeIdentifier
///                       typeParameters? superclass? interfaces?
///                       '{' (metadata classMemberDeclaration)* '}'
///                       | classModifiers 'class' mixinApplicationClass
///
/// classModifiers    ::= 'sealed'
///                     | 'abstract'? ('base' | 'interface' | 'final')?
///
/// mixinClassModifiers ::= 'abstract'? 'base'? 'mixin'
///
/// mixinDeclaration  ::= 'base'? 'mixin' typeIdentifier typeParameters?
///                       ('on' typeNotVoidList)? interfaces?
///                       '{' (metadata classMemberDeclaration)* '}'
///
/// @description Check that it is a compile-time error if 'mixin', 'base', or
/// `abstract` modifiers goes in a wrong order
/// @author sgrekhov22@gmail.com

  base abstract mixin class C1 {}
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  base mixin abstract class C2 {}
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin base abstract class C3 {}
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin abstract base class C4 {}
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  abstract mixin base class C5 {}
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin abstract class C6 {}
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin base class C7 {}
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
}
