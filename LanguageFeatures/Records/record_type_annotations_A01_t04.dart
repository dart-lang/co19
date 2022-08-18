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

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef (int, String name, bool) R1((int, String name, bool) r);
typedef (int i, String s, bool b) R2((int i, String s, bool b));
typedef (int, String, bool) R3({required (int, String, bool) r});
typedef ({int n, String s}) R4(({int n, String s}));
typedef (bool, num, {int n, String s}) R5((bool, num, {int n, String s}));

R1 r1 = ((int, String name, bool) r) => r;
R2 r2 = ((int i, String s, bool b) r) => r;
R3 r3 = ({required (int, String, bool) r}) => r;
R4 r4 = (({int n, String s}) r) => r;
R5 r5 = ((bool, num, {int n, String s}) r) => r;

main() {
  Expect.isTrue(r1 is R2);
  Expect.isTrue(r2 is R1);
  Expect.isTrue(r1 is (int, String, bool) Function((int, String, bool) r));
  Expect.isTrue(r2 is (int, String, bool) Function((int, String, bool) r));
  Expect.isTrue(r3 is
    (int, String, bool) Function({required (int, String, bool) r}));
  Expect.isTrue(r4 is ({int n, String s}) Function(({int n, String s})));
  Expect.isTrue(r5 is
    (bool, num, {int n, String s}) Function((bool, num, {int n, String s})));
}
