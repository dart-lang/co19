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
/// There are no special rules for static members in extension types. They can
/// be declared and called or torn off as usual, e.g.,
/// AnExtensionType.myStaticMethod(42)
///
/// @description Checks that extension types may have static final and constant
/// members.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type ET1(int id) {
  static final int answer = 42;
  static const zero = 0;

  const ET1.named() : id = zero;
}

extension type ET2(List<int> id) {
  const ET2.named() : id = const [ET1.zero];
}

main() {
  Expect.equals(42, ET1.answer);
  Expect.identical(0, ET1.zero);
  Expect.listEquals([0], ET2.named().id);
  Expect.identical(const [0], const ET2.named().id);
  Expect.identical(const [0], ET2.named().id);
}
