/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double sin(num radians)
 * Converts [radians] to a double and returns the sine of the value.
 * @description Checks that Error is thrown when radian is a null (not a
 * number).
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Math.sin(null);
  });
}
