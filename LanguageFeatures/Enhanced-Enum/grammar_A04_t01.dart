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
/// @description Check grammar of the enum declaration
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

class A {
  const A();
}

enum E<T extends num> {
  @A() e1,
  @A() e2(),
  @A() e3<int>.named(42);

  const E.named(int x);
}

main() {
  E.e1;
}
