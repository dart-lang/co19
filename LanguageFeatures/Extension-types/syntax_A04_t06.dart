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
/// @description Checks that it is a compile-time error if `type` in
/// `representationDeclaration` is `var` or `var type`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

extension type ET1(var id) {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2.n1(var int id) {}
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
}
