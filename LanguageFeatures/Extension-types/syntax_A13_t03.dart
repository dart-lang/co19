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
/// has the name which is a built-in identifier
/// @author sgrekhov22@gmail.com
/// @issue 53930

extension type abstract(int id) {}
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type extension(int id) {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type factory(int id) {}
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type import(int id) {}
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type required(int id) {}
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type typedef(int id) {}
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
