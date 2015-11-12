/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predefined Dart function identical() is defined such that
 * identical(c1, c2) iff:
 *  • c1 evaluates to either null or an instance of bool and c1 == c2.
 * @description Checks that two bool instances are identical() iff they are
 * equal
 * @author ilya
 */
import "../../../Utils/expect.dart";

var true2 = 0 is int;
var false2 = 0 is String;

main() {
  Expect.isTrue(identical(true, true));
  Expect.isTrue(identical(false, false));
  Expect.isTrue(identical(true2, true));
  Expect.isTrue(identical(false2, false));

  Expect.isFalse(identical(true, false));
  Expect.isFalse(identical(true2, false2));
}
