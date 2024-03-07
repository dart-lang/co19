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
/// @description Checks that it is not an error if an extension type has the
/// name which is OTHER_IDENTIFIER_NOT_TYPE
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type async(int id) {}

extension type hide(int id) {}

extension type of(int id) {}

extension type on(int id) {}

extension type show(int id) {}

extension type sync(int id) {}

extension type await(int id) {}

extension type yield(int id) {}

main() {
  Expect.equals(42, async(42).id);
  Expect.equals(42, hide(42).id);
  Expect.equals(42, of(42).id);
  Expect.equals(42, on(42).id);
  Expect.equals(42, show(42).id);
  Expect.equals(42, sync(42).id);
  Expect.equals(42, await(42).id);
  Expect.equals(42, yield(42).id);
}
