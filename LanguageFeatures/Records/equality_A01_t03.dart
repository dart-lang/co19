// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Records have value equality, which means two records are equal if
/// they have the same shape and the corresponding fields are equal. Since named
/// field order is not part of a record's shape, that implies that the order of
/// named fields does not affect equality:
///
/// var a = (x: 1, 2);
/// var b = (2, x: 1);
/// print(a == b); // true.
/// More precisely, the == method on record r with right operand o is defined as:
///
/// 1. If o is not a record with the same shape as r then false.
///
/// 2. For each pair of corresponding fields rf and of in unspecified order:
///
///  - If rf == of is false then false.
/// 3. Else, true.
///
/// @description Checks record equality
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

int foo() => 3;

main() {
  int i = 1;
  int j = 2;
  String s = "s";
  Expect.equals((1, 2, 3), (i, j, i + j));
  Expect.equals((1, 2, three: 3), (i, j, three: foo()));
  Expect.equals((1, 2, s: "s"), (i, j, s: s));
  Expect.equals((one: 1, two: 2, three: 3),
      (two: j, three: foo(), one: i));
}
