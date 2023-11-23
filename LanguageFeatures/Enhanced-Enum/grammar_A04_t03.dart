// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar of the enum declaration becomes:
///
/// <enumType> ::=
///   `enum' <identifier> <typeParameters>? <mixins>? <interfaces>? `{'
///      <enumEntry> (`,' <enumEntry>)* (`,')? (`;'
///      (<metadata> <classMemberDefinition>)*
///      )?
///   `}'
///
/// <enumEntry> ::= <metadata> <identifier> <argumentPart>?
///               | <metadata> <identifier> <typeArguments>? '.'
///               | identifier> <arguments>
///
/// @description Check that old syntax can be used together with the new one
/// @author sgrekhov@unipro.ru

enum E {
  e1,
  e2(),
  e3;

  const E();
}

main() {
  E.e1;
  E.e2;
}
