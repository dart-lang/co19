// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type alias declares a name for a type expression.
/// <typeAlias> ::=<metadata> typedef <typeIdentifier> <typeParameters>?‘=’<type>
/// ‘;’
/// | <metadata> typedef <functionTypeAlias>
///  <functionTypeAlias> ::= <functionPrefix> <formalParameterPart> ‘;’
///  <functionPrefix> ::= <type>? <identifier>
/// @description Checks that type alias syntax works as expected. Test
/// function type alias with no type parameters
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

typedef void F1(String s);
typedef F2(String s, int i);

test(F2 f2) {
  f2("Lily was here", 42);
}


main() {
  F1 f = (String s) {
    Expect.equals("123", s);
  };
  f("123");

  f2(String s, int i) {
    Expect.equals("Lily was here", s);
    Expect.equals(42, i);
  }
  test(f2);
}
