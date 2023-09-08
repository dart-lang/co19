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
/// ...
/// Some errors can be detected immediately from the syntax:
///
/// A compile-time error occurs if the extension type declaration declares any
/// instance variables, unless they are external
///
/// @description Checks that it is a compile-time error if an extension type
/// declaration declares any late instance variables.
/// @author sgrekhov22@gmail.com
/// @issue 53467

// SharedOptions=--enable-experiment=inline-class

extension type ET1(int id) {
//                     ^^
// [cfe] unspecified
  late int id = 0;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {
  late int x = 0;
//         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {
  late final x = 0;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) {
  late final int x;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
