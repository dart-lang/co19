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
/// @description Check that it is a compile-time error if 'base', 'interface' or
/// 'final' modifiers are placed before an `abstract` modifier
/// @author sgrekhov22@gmail.com

  base abstract class C1 {}
//^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface abstract class C2 {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final abstract class C3 {}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
}
