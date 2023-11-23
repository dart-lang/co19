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
/// function type alias with type parameters
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

typedef void F1<T>(String s);
typedef F2<T>(String s, T i);
typedef F3<T extends num>(String s, T i);

test1(F2<int> f2) {
  f2("Lily was here", 42);
}

test2(F3<double> f3) {
  f3("Lily was here", 3.14);
}

main() {
  F1<int> f = (String s) {
    Expect.equals("123", s);
  };
  f("123");

  f2(String s, int i) {
    Expect.equals("Lily was here", s);
    Expect.equals(42, i);
  }
  F3<double> f3 = (String s, double d) {
    Expect.equals("Lily was here", s);
    Expect.equals(3.14, d);
  };
  test1(f2);
  test2(f3);
}
