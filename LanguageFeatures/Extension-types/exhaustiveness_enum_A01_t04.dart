// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with enum as a matched type are
/// always exhaustive
///
/// @description Check that it is no compile-time error if a matched type of a
/// switch expression is an extension type with an enum as a representation type
/// and the set of cases is exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

enum E {
  a, b, c
}

extension type ET1(E _) {}
extension type ET2(E _) implements E {}

String testStatement1(ET1 e) {
  switch (e) {
    case E.a:
    case E.b:
    case E.c:
      return "ok";
  }
}

String testStatement2(ET2 e) {
  switch (e) {
    case E.a:
    case E.b:
      return "ok1";
    case E.c:
      return "ok2";
  }
}

String testExpression1(ET1 e) =>
  switch (e) {
    E.a => "a",
    E.b => "b",
    E.c => "c"
  };

String testExpression2(ET2 e) =>
  switch (e) {
    E.a => "a",
    E.b => "b",
    E.c => "c"
  };

main() {
  Expect.equals("ok", testStatement1(ET1(E.a)));
  Expect.equals("ok", testStatement1(ET1(E.b)));
  Expect.equals("ok", testStatement1(ET1(E.c)));
  Expect.equals("a", testExpression1(ET1(E.a)));
  Expect.equals("a", testExpression1(ET1(E.b)));
  Expect.equals("c", testExpression1(ET1(E.c)));

  Expect.equals("ok1", testStatement2(ET2(E.a)));
  Expect.equals("ok1", testStatement2(ET2(E.b)));
  Expect.equals("ok2", testStatement2(ET2(E.c)));
  Expect.equals("a", testExpression2(ET2(E.a)));
  Expect.equals("b", testExpression2(ET2(E.b)));
  Expect.equals("c", testExpression2(ET2(E.c)));
}
