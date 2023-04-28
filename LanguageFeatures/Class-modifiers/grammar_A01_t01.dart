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
/// @description Check that it is a compile-time error if any of
/// keywords/built-in identifiers `abstract`, `final`, `interface`, `mixin`, or
/// `class` is used as an identifier
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class class {}
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class interface {}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class abstract {}
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class mixin {}
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
