// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
/// The token inline is not made a built-in identifier: the reserved word class
/// that occurs right after inline serves to disambiguate the inline class
/// declaration with a fixed lookahead.
///
/// @description Checks that it is not an error to declare a class named
/// `inline`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class inline {
}

main() {
  inline();
}
