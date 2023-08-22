// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <extensionTypeDeclaration> is added to the grammar,
/// along with some rules for elements used in extension type declarations:
///
/// <extensionTypeDeclaration> ::=
///   'extension' 'type' 'const'? <typeIdentifier> <typeParameters>?
///   <representationDeclaration> <interfaces>?
///   '{'
///     (<metadata> <extensionTypeMemberDeclaration>)*
///   '}'
///
/// <representationDeclaration> ::=
///   ('.' <identifierOrNew>)? '(' <metadata> <type> <identifier> ')'
///
/// <identifierOrNew> ::= <identifier> | 'new'
///
/// <extensionTypeMemberDeclaration> ::= <classMemberDefinition>
///
/// @description Checks that it is a compile-time error if an extension type
/// has a nullable type as a superinterface
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

typedef NullableInt = int?;

extension type ET1(int id) implements int? {}
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(int? id) implements int? {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3(int id) implements NullableInt {}
//                                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET4(int? id) implements NullableInt {}
//                                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
