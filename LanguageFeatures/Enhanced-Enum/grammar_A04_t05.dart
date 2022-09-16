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
/// @description Check grammar of the enum declaration. Test covariant members
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E<T> {
  e1,
  e2(),
  e3<int>.named(42);

  const E();
  const E.named(int x);
  int foo(covariant int x) => x;
}

main() {
  Expect.equals(1, E.e1.foo(1));
  Expect.equals(2, E.e2.foo(2));
  Expect.equals(3, E.e3.foo(3));
}
