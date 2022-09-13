// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the type system, each record has a corresponding record type.
/// A record type looks similar to a function type's parameter list. The type is
/// surrounded by parentheses and may contain comma-separated positional fields:
///
/// (int, String name, bool) triple;
/// Each field is a type annotation and an optional name which isn't meaningful
/// but is useful for documentation purposes.
///
/// Named fields go inside a brace-delimited section of type and name pairs:
///
/// ({int n, String s}) pair;
/// A record type may have both positional and named fields:
///
/// (bool, num, {int n, String s}) quad;
///
/// @description Checks records type annotations in type arguments
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

T foo<T extends Record>(T t) => t;
T bar<T extends (num, {Object o})>(T t) => t;

class C1<T extends Record> {
  T t;
  C1(this.t);
}

class C2<T extends (num, {Object o})> {
  T t;
  C2(this.t);
}

main() {
  Expect.equals((1, 2), foo<(int i, int)>((1, 2)));
  Expect.equals((1, n: "x"), foo<(int i, {String n})>((1, n: "x")));
  Expect.equals((d: 1.1, n: ""), foo<({double d, String n})>((d: 1.1, n: "")));
  Expect.equals((1, o: ""), bar<(int i, {String o})>((1, o: "")));
  Expect.equals((3.14, o: [1, 2]),
      bar<(double, {List<int> o})>((3.14, o: [1, 2])));

  Expect.equals((1, 2), C1<(int i, int)>((1, 2)).t);
  Expect.equals((1, n: "x"), C1<(int i, {String n})>((1, n: "x")).t);
  Expect.equals((d: 1.1, n: ""), C1<({double d, String n})>((d: 1.1, n: "")).t);
  Expect.equals((1, o: ""), C2<(int i, {String o})>((1, o: "")).t);
  Expect.equals((3.14, o: [1, 2]),
      C2<(double, {List<int> o})>((3.14, o: [1, 2])).t);
}
