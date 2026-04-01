// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <classDeclaration> ::= // First alternative modified.
///      (<classModifiers> | <mixinClassModifiers>)
///      'class' <classNameMaybePrimary> <superclass>? <interfaces>?
///      <memberedDeclarationBody>
///    | ...;
///
/// <primaryConstructor> ::= // New rule.
///      'const'? <typeWithParameters> ('.' <identifierOrNew>)?
///      <declaringParameterList>;
///
/// <classNameMaybePrimary> ::= // New rule.
///      <primaryConstructor>
///    | <typeWithParameters>;
///
/// <typeWithParameters> ::= <typeIdentifier> <typeParameters>?
///
/// @description Check that it is a syntax error if a primary constructor
/// declaration contains any metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

const meta = 1;

class @meta C(var int v);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin class @meta M();
//          ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum @meta E(final int v) {
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(0);
}

extension type @meta ET(int _) {}
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
