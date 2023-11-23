// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This operator implements bit-wise negation operation.
/// @description Checks that this operator returns correct value.
/// @author vasya

import "../../../Utils/expect.dart";
main() {
  if (!isJS) {
    check(0);
    check(1);
    check(-1);
    check(15);
    check(-16);
    check(9);
    check(-10);
    check(2147483647);
    check(4294967295);
    check(9007199254740991);
    check(-2147483647);
    check(-4294967295);
    check(-9007199254740991);
  }
}

void check(int x) {
  Expect.equals(-1 - x, ~x);
}
