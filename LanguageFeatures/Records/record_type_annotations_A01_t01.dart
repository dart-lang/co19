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
/// @description Checks records type annotations static and runtime types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

(int, String name, bool) r1 = (42, "Name", true);
({int n, String s}) r2 = (n: 0, s: "Lily was here"});
(bool, num, {int n, String s}) r3 = (s: "Hi", true, n: 0, 42);

(int, String name, bool) foo1() => r1;
({int n, String s}) foo2() => r2;
(bool, num, {int n, String s}) foo3() => r3;

main() {
  Expect.isTrue(r1 is (int, String name, bool));
  Expect.isTrue(r1 is (int i, String s, bool b));
  Expect.isTrue(r1 is (int, String, bool));
  Expect.isTrue(r2 is ({int n, String s}));
  Expect.isTrue(r3 is (bool, num, {int n, String s}));

  Expect.isTrue(foo1() is (int, String name, bool));
  Expect.isTrue(foo2() is ({int n, String s}));
  Expect.isTrue(foo3() is (bool, num, {int n, String s}));
}
