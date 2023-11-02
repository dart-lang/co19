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
/// has the name which is OTHER_IDENTIFIER_NOT_TYPE
/// @author sgrekhov22@gmail.com
/// @issue 53930

// SharedOptions=--enable-experiment=inline-class

extension type async(int id) {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type hide(int id) {}
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type of(int id) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

extension type on(int id) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

extension type show(int id) {}
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type sync(int id) {}
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type await(int id) {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type yield(int id) {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
