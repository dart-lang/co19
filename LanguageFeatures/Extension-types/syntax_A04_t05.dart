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
/// @description Checks that `representationDeclaration` may have `metadata`
/// part
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

const Meta1 = 2023;
class Meta2 {
  const Meta2();
}

extension type ET1(@Meta1 @Meta2() int id) {}
extension type ET2.n1(@Meta1 @Meta2()  int id) {}
extension type ET3.new(@Meta1 @Meta2()  int id) {}

main() {
  ET1(1);
  ET2.n1(2);
  ET3(3);
}
