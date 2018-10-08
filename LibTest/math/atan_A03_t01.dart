/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double atan(num x)
 * Converts [x] to a dobule and returns its arc tangent in radians.
 * @description Checks that Error is thrown when an argument is a null (not a
 * number).
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Math.atan(null);
  });
}
