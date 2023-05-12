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
/// @description Checks records type annotations static and runtime types. Test
/// types `void` and `Never` in a records
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

(int, String name, void) r1 = (42, "Name", true);
({int n, void v}) r2 = (n: 0, v: "Lily was here");

(int, String name, void) foo1() => r1;
({int n, void v}) foo2() => r2;

(int, String, Never) foo3() => (1, "2", throw Exception());
({int i, String s, Never n}) foo4() => (i: 1, s: "2", n: throw Exception());

main() {
  Expect.isTrue(r1 is (int, String name, void));
  Expect.isTrue(r1 is (int i, String s, void b));
  Expect.isTrue(r1 is (int, String, void));
  Expect.isTrue(r2 is ({int n, void v}));

  Expect.isTrue(foo1() is (int, String name, void));
  Expect.isTrue(foo2() is ({int n, void v}));
  Expect.isTrue(foo3 is (int, String, Never) Function());
  Expect.isTrue(foo4 is ({int i, String s, Never n}) Function());
}
