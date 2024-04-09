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

import "../../Utils/expect.dart";

enum E<T> {
  a<int>(),
  b<String>(),
  c<double>(),
}

extension type ET1<T>(E<T> _) {}
extension type ET2<T>(E<T> _) implements E<T> {}

String testStatement1(ET1<num> e) {
  switch (e) {
    case E.a:
    case E.c:
      return "ok";
  }
}

String testStatement2(ET2<num> e) {
  switch (e) {
    case E.a:
    case E.c:
      return "ok";
  }
}

String testExpression1(ET1<num> e) =>
  switch (e) {
    E.a => "a",
    E.c => "c"
  };

String testExpression2(ET2<num> e) =>
  switch (e) {
    E.a => "a",
    E.c => "c"
  };

main() {
  Expect.equals("ok", testStatement1(ET1<num>(E.a)));
  Expect.equals("ok", testStatement1(ET1(E.c)));
  Expect.equals("a", testExpression1(ET1<num>(E.a)));
  Expect.equals("c", testExpression1(ET1(E.c)));

  Expect.equals("ok", testStatement2(ET2<num>(E.a)));
  Expect.equals("ok", testStatement2(ET2(E.c)));
  Expect.equals("a", testExpression2(ET2<num>(E.a)));
  Expect.equals("c", testExpression2(ET2(E.c)));
}
