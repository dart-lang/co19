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
/// @description Checks records type annotations used in a typedef statements
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef R1 = (int, String name, bool);
typedef R2 = (int i, String s, bool b);
typedef R3 = (int, String, bool);

typedef R4 = ({int n, String s});
typedef R5 = (bool, num, {int n, String s});

R1 r1 = (42, "Name", true);
R2 r2 = (42, "Name", true);
R3 r3 = (42, "Name", true);

R4 r4 = (n: 0, s: "Lily was here");
R5 r5 = (s: "Hi", true, n: 0, 42);

main() {
  Expect.isTrue(r1 is R2);
  Expect.isTrue(r1 is R3);
  Expect.isTrue(r2 is R1);
  Expect.isTrue(r2 is R3);
  Expect.isTrue(r3 is R1);
  Expect.isTrue(r3 is R2);

  Expect.isTrue(r4 is ({int n, String s}));
  Expect.isTrue(r5 is (bool, num, {int n, String s}));
}
