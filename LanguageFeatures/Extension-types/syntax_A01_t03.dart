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
/// The token `type` is not made a built-in identifier: the built-in identifier
/// extension that occurs right before type serves to disambiguate the extension
/// type declaration with a fixed lookahead.
///
/// @description Checks that it is not an error to import a library with
/// import prefix `type`
/// @author sgrekhov22@gmail.com

import "extension_type_lib.dart" as type;

main() {
  print(type.x);
}
