/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 * . . .
 *  • c1 and c2 are instances of int and c1 == c2.
 * @description Checks that two int instances are identical() iff they are
 * equal
 * @author ilya
 */
import "../../../Utils/expect.dart";

var n4 = 4;
var n7 = 3 + n4;

main() {
  Expect.isTrue(identical(1, 1));
  Expect.isTrue(identical(7, n7));

  Expect.isFalse(identical(7, n7 << 1));
}
