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
/// ...
/// The name of the representation in an extension type declaration with a
/// representation declaration of the form (T id) is the identifier id, and the
/// type of the representation is T.
///
/// @description Checks that static type of `id` is its declared type and there
/// is a getter named `id`
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type ET1(num id) {}

extension type ET2.n(int _x) {}

extension type ET3.new(int _id) {}

main() {
  ET1 et1 = ET1(3.14);
  et1.id.expectStaticType<Exactly<num>>();
  ET2 et2 = ET2.n(42);
  et2._x.expectStaticType<Exactly<int>>();
  ET3 et3 = ET3(3);
  et3._id.expectStaticType<Exactly<int>>();
}
