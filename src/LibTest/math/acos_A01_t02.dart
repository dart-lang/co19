/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the arc cosine of a value.
 * @description Checks returned values on special arguments.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.acos(0/0).isNaN);
  Expect.isTrue(Math.acos(1/0).isNaN);
  Expect.isTrue(Math.acos(-1/0).isNaN);
}
