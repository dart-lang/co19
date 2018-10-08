/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double log(num x)
 * Converts [x] to a double and returns the natural logarithm of the value.
 * @description Checks that Error is thrown an argument is a null (not a
 * number).
 * @author msyabro
 * @needsreview undocumented
 * @reviewer pagolubev
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Math.log(null);
  });
}
