/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluates the trigonometric cosine of an angle.
 * @description Checks special values.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

#import("dart:math", prefix: "Math");

main() {
  Expect.isTrue(Math.cos(double.NAN).isNaN());
  Expect.isTrue(Math.cos(double.INFINITY).isNaN());
  Expect.isTrue(Math.cos(double.NEGATIVE_INFINITY).isNaN());
}
