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
/// has the name which is a reserved word or `extension`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type extension(int id) {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type class(int id) {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type if(int id) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
