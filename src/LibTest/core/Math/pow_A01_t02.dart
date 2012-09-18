/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static num pow(num x, num exponent)
 * @description Checks the method with integer arguments
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview issue 1267
 */

#import("dart:math", prefix: "Math");

main() {
  Math.pow(2, 2);
}
