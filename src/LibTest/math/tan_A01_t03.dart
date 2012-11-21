/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluates the trigonometric tangent of an angle.
 * @description Checks that an error is thrown when passed argument is a null.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;

main() {
  try {
    Math.tan(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
