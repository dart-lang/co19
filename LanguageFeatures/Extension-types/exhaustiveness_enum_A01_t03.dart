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

String testStatement1<T extends num>(ET1<T> e) {
  switch (e) {
    case E.a || E.c:
      return "ok";
  }
}

String testStatement2<T extends num>(ET2<T> e) {
  switch (e) {
    case E.a || E.c:
      return "ok";
  }
}

String testExpression1<T extends num>(ET1<T> e) =>
  switch (e) {
    E.a || E.c => "ok"
  };

String testExpression2<T extends num>(ET2<T> e) =>
  switch (e) {
    E.a || E.c => "ok"
  };

main() {
  Expect.equals("ok", testStatement1(ET1<num>(E.a)));
  Expect.equals("ok", testStatement1(ET1(E.c)));
  Expect.equals("ok", testStatement1<int>(ET1<int>(E.a)));
  Expect.equals("ok", testStatement1<double>(ET1(E.c)));
  Expect.equals("ok", testExpression1(ET1<num>(E.a)));
  Expect.equals("ok", testExpression1(ET1(E.c)));
  Expect.equals("ok", testExpression1<int>(ET1<int>(E.a)));
  Expect.equals("ok", testExpression1<double>(ET1(E.c)));

  Expect.equals("ok", testStatement2(ET2<num>(E.a)));
  Expect.equals("ok", testStatement2(ET2(E.c)));
  Expect.equals("ok", testStatement2<int>(ET2<int>(E.a)));
  Expect.equals("ok", testStatement2<double>(ET2(E.c)));
  Expect.equals("ok", testExpression2(ET2<num>(E.a)));
  Expect.equals("ok", testExpression2(ET2(E.c)));
  Expect.equals("ok", testExpression2<int>(ET2<int>(E.a)));
  Expect.equals("ok", testExpression2<double>(ET2(E.c)));
}
