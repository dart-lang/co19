// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The implementation of hashCode follows this. The hash code
/// returned should depend on the field values such that two records that
/// compare equal must have the same hash code.
///
/// @description Checks that if records are equal then they have the same hash
/// code
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

int foo() => 3;

main() {
  int i = 1;
  int j = 2;
  String s = "s";
  Expect.equals((1, 2, 3).hashCode, (i, j, i + j).hashCode);
  Expect.equals((1, 2, three: 3).hashCode, (i, j, three: foo()).hashCode);
  Expect.equals((1, 2, s: "s").hashCode, (i, j, s: s).hashCode);
  Expect.equals(("one": 1, "two": 2, "three": 3).hashCode,
      ("one": i, "two": j, "three": foo()).hashCode);
}
