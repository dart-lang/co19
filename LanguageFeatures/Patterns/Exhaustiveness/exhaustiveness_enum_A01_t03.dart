// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with enum as a matched type are
/// always exhaustive
///
/// @description Check that it is no compile-time error if a matched type of a
/// switch expression is an enum and the set of cases is exhaustive
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../../Utils/expect.dart";

enum E<T> {
  a<int>(),
  b<String>(),
  c<double>(),
}

String test1<T extends num>(E<T> e) {
  switch (e) {
    case E.a || E.c:
      return "ok";
  }
}

String test2<T extends num>(E<T> e) =>
  switch (e) {
    E.a || E.c => "ok"
  };

main() {
  Expect.equals("ok", test1(E.a));
  Expect.equals("ok", test1(E.c));
  Expect.equals("ok", test1<int>(E.a));
  Expect.equals("ok", test1<double>(E.c));
  Expect.equals("ok", test2(E.a));
  Expect.equals("ok", test2(E.c));
  Expect.equals("ok", test2<int>(E.a));
  Expect.equals("ok", test2<double>(E.c));
}
