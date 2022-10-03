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
/// @description Checks that the records with the different shapes are not equal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

main() {
  Expect.notEquals((1, 2, 3), (1, 2, 3, 4));
  Expect.notEquals((1, 2, 3), (1, 2, three: 3));
  Expect.notEquals((1, 2, 3), (1, 2, 3, x: 0));
  Expect.notEquals((1, 2, s: "s"), (1, 2, notS: "s"));
  Expect.notEquals((one: 1, two: 2), (one: 1, two: 2, l: []));
  Expect.notEquals((one: 1, two: 2), (one: 1, TWO: 2));
  Expect.notEquals(([1, 2, 3],), ([1, 2, 3], ()));
}
